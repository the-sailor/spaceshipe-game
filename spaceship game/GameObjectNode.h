//
//  GameObjectNode.h
//  spaceship game
//
//  Created by Meirav Shapira on 11/6/15.
//  Copyright © 2015 NOVN. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface GameObjectNode : SKSpriteNode

- (BOOL)collisionWithPlayer:(SKNode *)player;
-(void)update;

@property (nonatomic,assign) CGFloat moveByX;


@end

