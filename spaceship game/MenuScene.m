//
//  MenuScene.m
//  spaceship game
//
//  Created by Meirav Shapira on 11/3/15.
//  Copyright © 2015 NOVN. All rights reserved.
//

#import "MenuScene.h"
#import "GameScene.h"

@implementation MenuScene

-(instancetype)initWithSize:(CGSize)size{
    
    self= [super initWithSize:size];
    
    if(self){
        
        self.backgroundColor = [SKColor purpleColor];
        
        SKLabelNode * myLabel = [SKLabelNode labelNodeWithFontNamed:@"chalkduster"];
        
        myLabel.text = @"Menu";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        
        [self addChild:myLabel];
        
    }
    
    return self;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    // Create and configure the scene.
    GameScene *scene = [GameScene sceneWithSize:self.view.bounds.size];//[GameScene unarchiveFromFile:@"GameScene"];
    scene.scaleMode = SKSceneScaleModeAspectFill;
   
    SKTransition * transScenes = [SKTransition fadeWithColor:[SKColor whiteColor] duration:2.5];
    [self.view presentScene:scene transition:transScenes];
}

@end
