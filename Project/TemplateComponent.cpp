//
//  TemplateComponent.cpp
//  Hydra_iOS_Template
//
//  Created by Bernhard Mies on 07.10.13.
//  Copyright (c) 2013 Woodland Barbarians. All rights reserved.
//

#include "TemplateComponent.hpp"
#include "ProjectController.hpp"
#include <Hydra/HydraMath.hpp>
#include <Hydra/OglEs2RenderEngine.h>
#include <Hydra/H2Effect.hpp>
#include <Hydra/H2ParticleManager.hpp>
#include <Hydra/CollisionManager.hpp>

TemplateComponent::TemplateComponent() {
}

TemplateComponent::~TemplateComponent() {
    
}

void TemplateComponent::Load() {
    Component::Load();
    
    ResMgr()->LoadTextureScope("template");
    
    H2AlphaState* as = Renderer()->GetAlphaState(H2AlphaState::SBF_SRC_ALPHA, H2AlphaState::DBF_ONE_MINUS_SRC_ALPHA);
    Root()->RenderState(as);
    
}



void TemplateComponent::Start(std::string fromComponent) {
    Component::Start(fromComponent);
    Ctrl()->SetTimestamp(0.0f);
    
    // Init & Load component objects
    
    // config renderer
    Renderer()->BackgroundColor(vec4(0.6,0.6,0.6,1));
    Renderer()->CurrentScene(Root());
    Renderer()->ValidateEngine();
    
}



void TemplateComponent::Stop() {
    Renderer()->CurrentScene(NULL);
    
    App()->ReleaseAllAnimators();
    
    Root()->RemoveAllChildren();
    
    ResMgr()->ReleaseSpritePool();
    
    Component::Stop();
}

void TemplateComponent::Update() {
    Component::Update();
    
    float ms = Ctrl()->GetTimestamp();
    

    int touchNum = App()->GetNumOfTouches();
    IndexedTouchEntry* touches = App()->GetActiveTouchEntries();
    
    Root()->Update(Ctrl());
    
}

void TemplateComponent::OnTouch(int category, H2Spatial *listener, IndexedTouchEntry& touch) {
    
}

void TemplateComponent::OnRotation(DeviceOrientation orientation) {
    
}

void TemplateComponent::OnAppMessage(std::string message) {
}

