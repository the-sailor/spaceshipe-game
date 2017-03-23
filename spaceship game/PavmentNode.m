//
//  PavmentNode.m
//  spaceship game
//
//  Created by Meirav Shapira on 11/6/15.
//  Copyright © 2015 NOVN. All rights reserved.
//

#import "PavmentNode.h"


@implementation HoleLocation

-(instancetype)initWithxLocation:(CGFloat)xLocation width:(CGFloat)width{
    
    self = [super init];
    
    if(self){
        
        _xLocation = xLocation;
        _width = width;
        
    }
    return self;
}

@end

@interface PavmentNode ()

@property (nonatomic,assign) CGFloat xStart;
@property (nonatomic,assign) CGFloat width;
@property (nonatomic,assign) CGFloat height;
@property (nonatomic,strong) SKSpriteNode *pavmentGroupSecondry;
@end

@implementation PavmentNode

-(instancetype)initWithColor:(UIColor *)color size:(CGSize)size holesLocation:(NSArray *)holesLocation{
    self = [super initWithColor:color size:size];
    
    if(self){
        _width = size.width;
        _height = size.height;
        _xStart = -400;
        
        _pavmentGroupSecondry = [[SKSpriteNode alloc]initWithColor:color size:size];

        [self createPavment:holesLocation];
        
    }
    
    return self;
}

//-(void)setPosition:(CGPoint)position{
//    
//    super.position = position;
//    
//    _pavmentGroupSecondry.position = CGPointMake(position.x + _width, position.y);
//}

-(void)createPavment:(NSArray *)holes{
    
    CGFloat beginNextNode = _xStart;
    
    for (HoleLocation * holeLocation in holes) {
        
        SKSpriteNode * solid = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(holeLocation.xLocation - beginNextNode, _height)];
        solid.position = CGPointMake(beginNextNode + ((holeLocation.xLocation - beginNextNode)/2.0) ,0);
        [self addChild:solid];
        [_pavmentGroupSecondry addChild:[solid copy]];

        
        SKSpriteNode * hole = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(holeLocation.width, _height)];
        hole.position = CGPointMake(holeLocation.xLocation + holeLocation.width/2.0 ,0);
        hole.name = @"hole";
        hole.zPosition = 3;
        [self addChild:hole];
        [_pavmentGroupSecondry addChild:[hole copy]];
        
        beginNextNode = holeLocation.xLocation + holeLocation.width;
    }
}


-(void)update{
    
    if(!_pavmentGroupSecondry.parent){
        [self.parent addChild:_pavmentGroupSecondry];
        _pavmentGroupSecondry.zPosition = self.zPosition;
    }
    
    self.position = CGPointMake(self.position.x - super.moveByX, self.position.y);
    
    if(self.position.x <= (self.frame.size.width * -1)){
        self.position = CGPointMake(self.position.x + self.frame.size.width, self.position.y);
    }
    
    _pavmentGroupSecondry.position = CGPointMake(self.position.x + _pavmentGroupSecondry.frame.size.width, _pavmentGroupSecondry.position.y);
}
@end
