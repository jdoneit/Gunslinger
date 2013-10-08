//
//  ComponentTemplate.h
//  Glued
//
//  Created by Bernhard Mies on 23.05.13.
//  Copyright (c) 2013 Woodland Barbarians. All rights reserved.
//

#pragma once
#include <vector>
#include <Hydra/Application.hpp>
#include <Hydra/Component.hpp>
#include <Hydra/ComponentController.hpp>
#include <Hydra/IH2RenderEngine.h>
#include <Hydra/IH2ResourceManager.h>
#include <Hydra/H2Sprite.hpp>
#include <Hydra/H2FontRenderer.hpp>
#include <Hydra/HydraTimer.hpp>
#include "H2LetterAnimator.hpp"
#include "GluedDefines.h"
#include <Hydra/H2Filter.hpp>
#include <Hydra/H2ParticleInterfaces.hpp>

class ComponentTemplate : public Component {
public:
    enum MenuState {
        MENU_STATE_INTRO,
        MENU_STATE_RUNNING,
        MENU_STATE_RESUME,
        MENU_STATE_RESTART,
        MENU_STATE_QUIT
    };
    
    ComponentTemplate();
    ~ComponentTemplate();
    
    void Load();
    void Start(std::string fromComponent);
    void Stop();
    void Update();
    
    void OnTouch(int category, H2Spatial* listener, IndexedTouchEntry& touch);
    void OnRotation(DeviceOrientation orientation);
    
    void OnAppMessage(std::string message);
    
private:
    
    inline ComponentController* Ctrl()      { return App()->Ctrl(); }
    inline IH2RenderEngine*     Renderer()  { return App()->Renderer(); }
    inline IH2ResourceManager*  ResMgr()    { return App()->ResourceMgr(); }
    inline ISoundManager*       SndMgr()    { return App()->SoundMgr(); }
    
    MenuState _state;
    
    H2Sprite* _blackRect;
    H2Animator* _animBckFadeOut;
    
};

