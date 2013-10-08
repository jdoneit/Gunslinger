//
//  ProjectController.h
//  Hydra_iOS_Template
//
//  Created by Bernhard Mies on 07.10.13.
//  Copyright (c) 2013 Woodland Barbarians. All rights reserved.
//

#pragma once
#include <Hydra/ComponentController.hpp>

class ProjectController : public ComponentController {
public:
    ProjectController();
    virtual ~ProjectController();
    
    void Load();
    void Release();
    
    void SetApplication(Application* app)  { _application = app; }
    
private:
};

