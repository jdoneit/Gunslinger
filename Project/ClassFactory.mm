//
//  ClassFactory.cpp
//  Hydra_iOS_Template
//
//  Created by Bernhard Mies on 07.10.13.
//  Copyright (c) 2013 Woodland Barbarians. All rights reserved.
//

#include "ClassFactory.h"
#include "ProjectApplication.hpp"
#include "ProjectController.hpp"
#include <Hydra/H2ResourceManager.h>
#include <Hydra/H2SoundEngine.h>
#include <Hydra/OglEs2RenderEngine.h>
#include <Hydra/H2ParticleManager.hpp>

void* ClassFactory::createApplication() {
    return new ProjectApplication();
}

void* ClassFactory::createResourceMgr() {
    return new H2ResourceManager();
}

void* ClassFactory::createSoundMgr() {
    return new H2SoundEngine();
}

void* ClassFactory::createComponentCtrl() {
    return new ProjectController();
}

void* ClassFactory::createAchievementMgr() {
    return NULL;
}

void* ClassFactory::createEngine() {
    return new OglEs2RenderEngine();
}

void* ClassFactory::createParticleMgr() {
    return new H2ParticleManager();
}


int ClassFactory::getSystemCoordWidth(DeviceType deviceType) {
    if (deviceType == DEVICE_TYPE_IPHONE) {
        return 320;
    } else if (deviceType == DEVICE_TYPE_IPHONE_5) {
        return 320;
    } else if (deviceType == DEVICE_TYPE_IPAD) {
        return 360;
    } else {
        return 320;
    }
}

int ClassFactory::getSystemCoordHeight(DeviceType deviceType) {
    if (deviceType == DEVICE_TYPE_IPHONE) {
        return 480;
    } else if (deviceType == DEVICE_TYPE_IPHONE_5) {
        return 568;
    } else if (deviceType == DEVICE_TYPE_IPAD) {
        return 480;
    } else {
        return 480;
    }
}

int ClassFactory::getDeviceWidth(DeviceType deviceType) {
    if (deviceType == DEVICE_TYPE_IPHONE) {
        return 320;
    } else if (deviceType == DEVICE_TYPE_IPHONE_5) {
        return 320;
    } else if (deviceType == DEVICE_TYPE_IPAD) {
        return 768;
    } else {
        return 320;
    }
}

int ClassFactory::getDeviceHeight(DeviceType deviceType) {
    if (deviceType == DEVICE_TYPE_IPHONE) {
        return 480;
    } else if (deviceType == DEVICE_TYPE_IPHONE_5) {
        return 568;
    } else if (deviceType == DEVICE_TYPE_IPAD) {
        return 1024;
    } else {
        return 480;
    }
}


float ClassFactory::getSystemCoordWidthScale(DeviceType deviceType) {
    return 1.0f;
}

float ClassFactory::getSystemCoordHeightScale(DeviceType deviceType) {
    return 1.0f;
}

DeviceType ClassFactory::getDeviceType(int realScreenWidth, int realScreenHeight) {
    if ((realScreenWidth == 320 && realScreenHeight == 480) ||
        (realScreenWidth == 480 && realScreenHeight == 320) ||
        
        (realScreenWidth == 640 && realScreenHeight == 960) ||
        (realScreenWidth == 960 && realScreenHeight == 640))
        return DEVICE_TYPE_IPHONE;
    
    else if ((realScreenWidth == 768 && realScreenHeight == 1024) ||
             (realScreenWidth == 1024 && realScreenHeight == 768) ||
             
             (realScreenWidth == 1536 && realScreenHeight == 2048) ||
             (realScreenWidth == 2048 && realScreenHeight == 1536))
        return DEVICE_TYPE_IPAD;
    
    else if ((realScreenWidth == 640 && realScreenHeight == 1136) ||
             (realScreenWidth == 1136 && realScreenHeight == 640))
        return DEVICE_TYPE_IPHONE_5;
    
    else
        return DEVICE_TYPE_UNKNOWN;
}

float ClassFactory::getContentScale(int realScreenWidth, int realScreenHeight) {
    // iphone 4, 5 & ipad 3
    if ((realScreenWidth == 640 && realScreenHeight == 960) ||
        (realScreenWidth == 960 && realScreenHeight == 640) ||
        
        (realScreenWidth == 1536 && realScreenHeight == 2048) ||
        (realScreenWidth == 2048 && realScreenHeight == 1536) ||
        
        (realScreenWidth == 640 && realScreenHeight == 1136) ||
        (realScreenWidth == 1136 && realScreenHeight == 640)) {
        return 2.0f;
    } else {
        return 1.0f;
    }
}


DeviceOrientation ClassFactory::getDefaultOrientation() {
    return DeviceOrientationLandscapeLeft;
}



