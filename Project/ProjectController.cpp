//
//  ProjectController.cpp
//  Hydra_iOS_Template
//
//  Created by Bernhard Mies on 07.10.13.
//  Copyright (c) 2013 Woodland Barbarians. All rights reserved.
//

#include "ProjectController.hpp"

ProjectController::ProjectController() {
    _instance = this;
}

ProjectController::~ProjectController() {
    
}

void ProjectController::Load() {
    ComponentController::Load();
}

void ProjectController::Release() {
    ComponentController::Release();
}