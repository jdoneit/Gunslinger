//
//  ProjectApplication.h
//  Hydra_iOS_Template
//
//  Created by Bernhard Mies on 07.10.13.
//  Copyright (c) 2013 Woodland Barbarians. All rights reserved.
//

#pragma once
#include <Hydra/Application.hpp>
#include <Hydra/IXmlManager.hpp>
#include "TemplateComponent.hpp"


class ProjectApplication : public Application {
public:
    
    ProjectApplication();
    ~ProjectApplication();
    
    void Update(float timestamp);
    
    void OnLoad();
    void OnInit();
    void OnStart();
    
    void CallComponent(std::string id, bool pauseCurrentOne);
    
    static IXmlManager* CreateXmlManager(xmlFactoryFnc factoryFnc);
    
    void SendMessage(std::string componentId, std::string message);
    
    void OnSystemPause();
    void OnSystemResume();
    
    
private:
    
    TemplateComponent  _templateComponent;

    IXmlManager* _xmlReader;
    
    std::string _nextFrameCmpToStart;
    
};
