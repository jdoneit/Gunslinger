//
//  ComponentTemplate.cpp
//  Glued
//
//  Created by Bernhard Mies on 23.05.13.
//  Copyright (c) 2013 Woodland Barbarians. All rights reserved.
//

#include "ComponentTemplate.hpp"
#include "GluedDefines.h"
#include <Hydra/HydraMath.hpp>
#include <Hydra/OglEs2RenderEngine.h>
#include "StageMenu.hpp"
#include "GluedController.h"
#include "BackgroundManager.h"
#include <Hydra/H2Effect.hpp>
#include <Hydra/H2ParticleManager.hpp>
#include "GluedComponent.h"

ComponentTemplate::ComponentTemplate() {
}

ComponentTemplate::~ComponentTemplate() {
    
}

void ComponentTemplate::Load() {
    Component::Load();
    
    
    H2AlphaState* as = Renderer()->GetAlphaState(H2AlphaState::SBF_SRC_ALPHA, H2AlphaState::DBF_ONE_MINUS_SRC_ALPHA);
    Root()->RenderState(as);
    
}



void ComponentTemplate::Start(std::string fromComponent) {
    Component::Start(fromComponent);
    Ctrl()->SetTimestamp(0.0f);
    
    vec2 screenBounds = Renderer()->Screenbounds();
    
    
    // black overlay
    _blackRect = ResMgr()->CreateColoredSprite("blackRect", EFFECT_SIMPLE, ivec2(screenBounds.x*2, screenBounds.y*2), ALIGN_CENTERED, vec4(1,1,1,1));
    _blackRect->Color(vec4(0,0,0,1));
    
    // font renderers
    H2Font font;
    font.Typeset = H2Font::FONT_BAUHAUS;
    font.Color = vec4(1,1,1,1);
    font.CharSize = ivec2(52,52);
    font.LetterSpace = ivec2(5,1);
    font.TextureId = "font_bauhaus";
    font.EffectId = EFFECT_TEXTURED;
    
    H2Font smallFont;
    smallFont.Typeset = H2Font::FONT_BAUHAUS_LT;
    smallFont.Color = vec4(1,1,1,1);
    smallFont.CharSize = ivec2(32,33);
    smallFont.LetterSpace = ivec2(5,1);
    smallFont.TextureId = "font_bauhaus";
    smallFont.EffectId = EFFECT_TEXTURED;
    
    
    Root()->Update(Ctrl());
    
    _animBckFadeOut = Ctrl()->CreateSpatialAnimator("overlayFadeOut");
    _animBckFadeOut->AddTarget(_blackRect);
    
    // config renderer
    Renderer()->BackgroundColor(vec4(0,0,0,1));
    Renderer()->CurrentScene(Root());
    Renderer()->ValidateEngine();
    
    _state = MENU_STATE_INTRO;
}



void ComponentTemplate::Stop() {
    ((GluedController*)Ctrl())->BackgroundMgr()->EnableGridModulator(false);
    
    Renderer()->CurrentScene(NULL);
    
    App()->ReleaseAllAnimators();
    
    Root()->RemoveAllChildren();
    
    Component::Stop();
}

void ComponentTemplate::Update() {
    Component::Update();
    
    
    float ms = Ctrl()->GetTimestamp();
    
    int touchNum = App()->GetNumOfTouches();
    IndexedTouchEntry* touches = App()->GetActiveTouchEntries();
    if (touchNum > 0) {
        for (int i = 0; i < touchNum; i++) {
            if (touches[i].New) {
            }
        }
    }
    
    
    if (_animBckFadeOut && _animBckFadeOut->Finished()) {
        Ctrl()->ReleaseAnimator(_animBckFadeOut);
        _animBckFadeOut = NULL;
        
        if (_state == MENU_STATE_INTRO) {
            _blackRect->Alpha(0.0f);
            _state = MENU_STATE_RUNNING;
        } else {
            _blackRect->Alpha(1.0f);
            
            switch (_state) {
                case MENU_STATE_RESUME:
                    break;
                    
                case MENU_STATE_RESTART:
                    break;
                    
                case MENU_STATE_QUIT:
                    break;
                    
                default:
                    _state = MENU_STATE_RUNNING;
                    break;
            }
        }
        
    }
    
    Root()->Update(Ctrl());
    
}

void ComponentTemplate::OnTouch(int category, H2Spatial *listener, IndexedTouchEntry& touch) {
    if (_state != MENU_STATE_RUNNING)
        return;
    
}

void ComponentTemplate::OnRotation(DeviceOrientation orientation) {
    
}

void ComponentTemplate::OnAppMessage(std::string message) {
}