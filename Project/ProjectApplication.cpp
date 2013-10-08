//
//  ProjectApplication.cpp
//  Hydra_iOS_Template
//
//  Created by Bernhard Mies on 07.10.13.
//  Copyright (c) 2013 Woodland Barbarians. All rights reserved.
//

#include "ProjectApplication.hpp"
#include "ProjectController.hpp"
#include "ProjectDefines.h"
#include <Hydra/IH2ResourceManager.h>
#include <Hydra/NSXmlMgrWrapper.h>
#include <Hydra/HydraClassFactory.hpp>



ProjectApplication::ProjectApplication() {
    
}

ProjectApplication::~ProjectApplication() {
    
}

void ProjectApplication::Update(float timestamp) {
    if (!_nextFrameCmpToStart.empty()) {
        StartComponent(_nextFrameCmpToStart);
        _nextFrameCmpToStart = "";
    }
    
    Application::Update(timestamp);
}

void ProjectApplication::OnInit() {
    
    _nextFrameCmpToStart = "";
    
    ((ProjectController*)Ctrl())->SetApplication(this);
    
    // register effects
    
    // simple colored quad
    H2OglEffectDescription colorDescr = H2OglEffectDescription("ColoredVertex", "ColoredFragment");
    Renderer()->RegisterEffect(EFFECT_SIMPLE, new H2OglColoredEffect(), &colorDescr);
    
    // boss filter
//    H2OglEffectDescription bossFilterDescr = H2OglEffectDescription("EdgeFilterVertex", "EdgeFilterFragment");
//    Renderer()->RegisterEffect(EFFECT_BOSS_FILTER, new H2OglBossEffect(), &bossFilterDescr);
    
    // textured quad
    H2OglEffectDescription texturedDescr = H2OglEffectDescription("TextureVertex", "TextureFragment");
    Renderer()->RegisterEffect(EFFECT_TEXTURED, new H2OglTexturedEffect(), &texturedDescr);
    
    // simple textured quad
    H2OglEffectDescription simpleTexturedDescr = H2OglEffectDescription("SimpleTextureVertex", "SimpleTextureFragment");
    Renderer()->RegisterEffect(EFFECT_SIMPLE_TEXTURED, new H2OglSimpleTexturedEffect(), &simpleTexturedDescr);
    
    // colored batch
    H2OglEffectDescription coloredBatchDescr = H2OglEffectDescription("ColoredBatchVertex", "ColoredBatchFragment");
    Renderer()->RegisterEffect(EFFECT_COLORED_BATCH, new H2OglTexturedBatchEffect(), &coloredBatchDescr);
    
    // textured batch
    H2OglEffectDescription texturedBatchDescr = H2OglEffectDescription("TexturedBatchVertex", "TexturedBatchFragment");
    Renderer()->RegisterEffect(EFFECT_TEXTURED_BATCH, new H2OglTexturedBatchEffect(), &texturedBatchDescr);
    
    // simple textured batch
    H2OglEffectDescription simpleTexBatchDescr = H2OglEffectDescription("FastTexturedBatchVertex", "FastTexturedBatchFragment");
    Renderer()->RegisterEffect(EFFECT_SIMPLE_TEX_BATCH, new H2OglSimpleTexturedBatchEffect(), &simpleTexBatchDescr);
    
    // hBlur
//    H2OglEffectDescription hBlurDescr = H2OglEffectDescription("BlurHVertex", "BlurHFragment");
//    Renderer()->RegisterEffect(EFFECT_H_BLUR, new H2OglTexturedEffect(), &hBlurDescr);
    
    // vBlur
//    H2OglEffectDescription vBlurDescr = H2OglEffectDescription("BlurVVertex", "BlurVFragment");
//    Renderer()->RegisterEffect(EFFECT_V_BLUR, new H2OglTexturedEffect(), &vBlurDescr);
    
    // framebuffer
    H2OglFramebufferEffect* fbe = new H2OglFramebufferEffect();
    fbe->DeferredEffect = Renderer()->Effect(EFFECT_SIMPLE_TEXTURED);
    Renderer()->RegisterEffect(EFFECT_FRAMEBUFFER, fbe, NULL);
    
    // gaussian blur
    H2OglEffectDescription gBlurDescr = H2OglEffectDescription("GaussBlurVertex", "GaussBlurFragment");
    Renderer()->RegisterEffect(EFFECT_GAUSSIAN_BLUR, new H2OglGaussianBlurEffect(), &gBlurDescr);
    
    // deferred blur
    H2OglDeferredBlurEffect* dbe = new H2OglDeferredBlurEffect();
    dbe->PassBlurEffect = Renderer()->Effect(EFFECT_GAUSSIAN_BLUR);
    dbe->PassSimpleTexEffect = Renderer()->Effect(EFFECT_SIMPLE_TEXTURED);
    dbe->PassTextureEffect = Renderer()->Effect(EFFECT_TEXTURED);
    Renderer()->RegisterEffect(EFFECT_DEFERRED_BLUR, dbe, NULL);
    
    //    Renderer()->SetDefaultFboEffect(EFFECT_TEXTURED);

    // create fbo's
    H2AlphaState* asoneone = Renderer()->GetAlphaState(H2AlphaState::SBF_ONE, H2AlphaState::DBF_ONE);
    H2AlphaState* asonezero = Renderer()->GetAlphaState(H2AlphaState::SBF_ONE, H2AlphaState::DBF_ZERO);
    Renderer()->CreateFBO(IH2RenderEngine::FBO_4, IH2RenderEngine::FBO_SIZE_FULL, asonezero);
    Renderer()->CreateFBO(IH2RenderEngine::FBO_1, IH2RenderEngine::FBO_SIZE_QUARTER, asoneone);
    Renderer()->CreateFBO(IH2RenderEngine::FBO_2, IH2RenderEngine::FBO_SIZE_QUARTER, asoneone);
    Renderer()->CreateFBO(IH2RenderEngine::FBO_3, IH2RenderEngine::FBO_SIZE_QUARTER, asoneone);
    
    
    Renderer()->ValidateEngine();
    
    // init components
    InitComponent(CMP_TEMPLATE, &_templateComponent);
    
}

void ProjectApplication::OnLoad() {
    
    // Load Sound Definitions
    _xmlReader = ProjectApplication::CreateXmlManager(HydraClassFactory::XmlReaderCreateSoundData);
    _xmlReader->ParseFile("Sounds");
    
    ResourceMgr()->AddSoundDefinitions(_xmlReader->GetResultList());
    ResourceMgr()->LoadSoundScope("global");
    LogMemUsage();
    
    free(_xmlReader);
    _xmlReader = NULL;
    
    // Load Texture Definitions
    _xmlReader = ProjectApplication::CreateXmlManager(HydraClassFactory::XmlReaderCreateTextureData);
    _xmlReader->ParseFile("Textures");
    
    ResourceMgr()->AddTextureDefinitions(_xmlReader->GetResultList());
    ResourceMgr()->LoadTextureScope(SCOPE_GLOBAL);
    //    ResourceMgr()->LoadTextureScope(SCOPE_GAME);
    
    free(_xmlReader);
    _xmlReader = NULL;
    
    // Load animation definitions
    _xmlReader = ProjectApplication::CreateXmlManager(HydraClassFactory::XmlReaderCreateAnimationData);
    _xmlReader->ParseFile("Animations");
    
    ResourceMgr()->AddAnimationDefinitions(_xmlReader->GetResultList());
    free(_xmlReader);
    _xmlReader = NULL;
    
    LoadComponent(CMP_TEMPLATE);
    
}

void ProjectApplication::OnStart() {
    
    
    StartComponent(CMP_TEMPLATE);
}

void ProjectApplication::CallComponent(std::string id, bool pauseCurrentOne) {
    Application::CallComponent(id, pauseCurrentOne);
    
    if (!_activeComponent)
        return;
    
	if (pauseCurrentOne) {
		PauseComponent(_activeComponent->Name());
	} else {
		StopComponent(_activeComponent->Name());
	}
    
    Renderer()->CurrentScene(NULL);
    
    ReleaseActiveComponent();
    _nextFrameCmpToStart = id;
	
	if (id.compare(CMP_TEMPLATE) == 0) {
        _nextFrameCmpToStart = CMP_TEMPLATE;
    }
}

IXmlManager* ProjectApplication::CreateXmlManager(xmlFactoryFnc factoryFnc) {
	IXmlManager* mgr = new NSXmlMgrWrapper();
	mgr->SetId(0);
	mgr->SetCallbacks(NULL, NULL, factoryFnc);
    return mgr;
}

void ProjectApplication::SendMessage(std::string componentId, std::string message) {
    if (componentId.compare(CMP_TEMPLATE) == 0) {
        _templateComponent.OnAppMessage(message);
    }
    
}

void ProjectApplication::OnSystemPause() {
    Application::OnSystemPause();
}

void ProjectApplication::OnSystemResume() {
    Application::OnSystemResume();
}




