//
//  BackgroundSprites.m
//  spaceship game
//
//  Created by Meirav Shapira on 11/6/15.
//  Copyright © 2015 NOVN. All rights reserved.
//

#import "BackgroundSprites.h"

@interface BackgroundSprites ()

@property(nonatomic,strong) SKSpriteNode * secondaryBackGround;
@property(nonatomic,assign) BOOL loops;

@end

@implementation BackgroundSprites

-(instancetype)initWithImage:(UIImage *)image loops:(BOOL)loops{
    
    SKTexture * texture = [SKTexture textureWithImage:image];

    self = [super initWithTexture:texture];
    
    if(self){
        
        _loops = loops;
        
        UIImage* flippedImage = [UIImage imageWithCGImage:image.CGImage
                                                    scale:image.scale
                                              orientation:UIImageOrientationUpMirrored];
        
        SKTexture * flippedTexture = [SKTexture textureWithImage:flippedImage];
        
        _secondaryBackGround = [[SKSpriteNode alloc] initWithTexture:flippedTexture];
        _secondaryBackGround.yScale = self.yScale;
        
    }
    return  self;
}


-(void)update{
    
    [super update];
    
    if(!_secondaryBackGround.parent){
        
        [self.parent addChild:_secondaryBackGround];
    }
    
    self.position = CGPointMake(self.position.x - super.moveByX, self.position.y);
    
    if(self.position.x <= (self.size.width) * -1){
        self.position = CGPointMake(self.position.x + self.size.width, self.position.y);
    }
    
    _secondaryBackGround.position = CGPointMake(self.position.x + self.size.width, self.position.y);
}


@end
