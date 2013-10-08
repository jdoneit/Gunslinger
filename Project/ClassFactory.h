//
//  TemplateClassFactory.h
//  Hydra_iOS_Template
//
//  Created by Bernhard Mies on 07.10.13.
//  Copyright (c) 2013 Woodland Barbarians. All rights reserved.
//

#pragma once

#include <Hydra/IHydraClassFactory.h>

class ClassFactory : public IHydraClassFactory {
public:
    
    // HYDRA SPECIFICS
    void* createApplication();
    void* createResourceMgr();
    void* createSoundMgr();
    void* createComponentCtrl();
    void* createAchievementMgr();
    void* createEngine();
    void* createParticleMgr();
    
    int getSystemCoordWidth(DeviceType deviceType);
    int getSystemCoordHeight(DeviceType deviceType);
    
    int getDeviceWidth(DeviceType deviceType);
    int getDeviceHeight(DeviceType deviceType);
    
    float getSystemCoordWidthScale(DeviceType deviceType);
    float getSystemCoordHeightScale(DeviceType deviceType);
    
    DeviceType getDeviceType(int realScreenWidth, int realScreenHeight);
    float getContentScale(int realScreenWidth, int realScreenHeight);
    DeviceOrientation getDefaultOrientation();
    
};
