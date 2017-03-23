//
//  GameScene.m
//  spaceship game
//
//  Created by Meirav Shapira on 11/2/15.
//  Copyright (c) 2015 NOVN. All rights reserved.
//

#import "GameScene.h"
#import "BackgroundSprites.h"
#import "PavmentNode.h"

@interface GameScene ()

@property (nonatomic,assign) BOOL gameOver;
@property (nonatomic,strong) BackgroundSprites * backGroundNode;
@property (nonatomic,strong) PavmentNode * topPavment;
@property (nonatomic,strong) PavmentNode * bottomPavment;


@end

@implementation GameScene

-(instancetype) initWithSize:(CGSize)size{
    
    self = [super initWithSize:size];
    
    if(self){
        
        _gameOver = NO;
        
    }
    return self;
}

-(void)didMoveToView:(SKView *)view {
    
    UIImage * backgroundImage = [UIImage imageNamed:@"space1"];
    _backGroundNode = [[BackgroundSprites alloc]initWithImage:backgroundImage loops:YES];
    _backGroundNode.yScale = 0.5;
    _backGroundNode.position = CGPointMake(self.size.width/2.0,self.size.height/2.0); //in relation to the ahcor point.
    _backGroundNode.moveByX = 0.2;

    [self createPavmentGroup];
   // [self createTopPavmentGroup];
    
    SKSpriteNode * ship = [[SKSpriteNode alloc]initWithImageNamed:@"ship"];
    ship.position = CGPointMake(self.size.width * 2 ,self.size.height/2.0);
    ship.name = @"ship";
    ship.xScale = -0.2;
    ship.yScale = 0.2;
    ship.zPosition = 1;
    
    NSMutableArray * images = [NSMutableArray array];
    for (int i=1; i<9; i++) {
        SKTexture * image = [SKTexture textureWithImageNamed:[NSString stringWithFormat:@"spaceWalk_test %d",i]];
        [images addObject:image];
    }
    
    SKSpriteNode * hero = [[SKSpriteNode alloc]initWithImageNamed:@"spaceWalk_test 1"];
    hero.position = CGPointMake(self.size.width/6, hero.size.height/2 + 30);
    hero.zPosition = 1.5;
    hero.name = @"hero";
    SKAction * myHeroAnimation = [SKAction animateWithTextures:images timePerFrame:0.1];
    [hero runAction:[SKAction repeatActionForever:myHeroAnimation]];
    
    [self addChild:_backGroundNode];
    
    [self addChild:ship];
    [self addChild:hero];
}

-(void)createPavmentGroup{
    
    NSMutableArray * holesLocation = [NSMutableArray array];
    
    [holesLocation addObject:[[HoleLocation alloc]initWithxLocation:350 width:150]];
    [holesLocation addObject:[[HoleLocation alloc]initWithxLocation:700 width:50]];
    [holesLocation addObject:[[HoleLocation alloc]initWithxLocation:900 width:200]];
    [holesLocation addObject:[[HoleLocation alloc]initWithxLocation:1500 width:300]];
    [holesLocation addObject:[[HoleLocation alloc]initWithxLocation:2500 width:100]];
    [holesLocation addObject:[[HoleLocation alloc]initWithxLocation:3000 width:200]];

    _topPavment = [[PavmentNode alloc]initWithColor:[SKColor clearColor] size:CGSizeMake(4350, 20) holesLocation:holesLocation];
    _topPavment.position = CGPointMake(self.size.width/2.0,20);
    _topPavment.zPosition =2;
    _topPavment.moveByX = 5;

    [self addChild:_topPavment];
    
    NSMutableArray * holesLocationBottom = [NSMutableArray array];
    
    [holesLocationBottom addObject:[[HoleLocation alloc]initWithxLocation:350 width:150]];
    [holesLocationBottom addObject:[[HoleLocation alloc]initWithxLocation:700 width:50]];
    [holesLocationBottom addObject:[[HoleLocation alloc]initWithxLocation:900 width:200]];
    [holesLocationBottom addObject:[[HoleLocation alloc]initWithxLocation:1500 width:300]];
    [holesLocationBottom addObject:[[HoleLocation alloc]initWithxLocation:2500 width:100]];
    [holesLocationBottom addObject:[[HoleLocation alloc]initWithxLocation:3000 width:200]];
    
    _bottomPavment = [[PavmentNode alloc]initWithColor:[SKColor clearColor] size:CGSizeMake(4350, 20) holesLocation:holesLocationBottom];
    _bottomPavment.position = CGPointMake(self.size.width/2.0,300);
    _bottomPavment.zPosition = 2;
    _bottomPavment.moveByX = 5;
    
    [self addChild:_bottomPavment];

}


-(void)createTopPavmentGroup{
    
    SKSpriteNode * pavmentGroup = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(4350, 20)];
    pavmentGroup.position = CGPointMake(self.size.width/2.0,300);
    pavmentGroup.zPosition = 2;
    pavmentGroup.name = @"pavmentGroup";
    
    SKSpriteNode * pavment = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(500, 20)];
    pavment.position = CGPointMake(-150,0);
    
    SKSpriteNode * hole1 = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(100, 20)];
    hole1.position = CGPointMake(150, 0);
    hole1.name = @"hole";
    
    SKSpriteNode * pavment2 = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(600, 20)];
    pavment2.position = CGPointMake(500,0);
    
    SKSpriteNode * hole2 = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(100, 20)];
    hole2.position = CGPointMake(850, 0);
    hole2.name = @"hole";
    
    SKSpriteNode * pavment3 = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(400, 20)];
    pavment3.position = CGPointMake(1100,0);

    SKSpriteNode * hole3 = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(100, 20)];
    hole3.position = CGPointMake(1350, 0);
    hole3.name = @"hole";
    
    SKSpriteNode * pavment4 = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(600, 20)];
    pavment4.position = CGPointMake(1700,0);

    SKSpriteNode * hole4 = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(300, 20)];
    hole4.position = CGPointMake(2150, 0);
    hole4.name = @"hole";
    
    SKSpriteNode * pavment5 = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(400, 20)];
    pavment5.position = CGPointMake(2500,0);
    
    SKSpriteNode * hole5 = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(200, 20)];
    hole5.position = CGPointMake(2800, 0);
    hole5.name = @"hole";

    SKSpriteNode * pavment6 = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(500, 20)];
    pavment6.position = CGPointMake(3150,0);
    
    SKSpriteNode * hole6 = [[SKSpriteNode alloc] initWithColor:[SKColor clearColor] size:CGSizeMake(150, 20)];
    hole6.position = CGPointMake(3475,0);
    hole6.name = @"hole";
    
    SKSpriteNode * pavment7 = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(400, 20)];
    pavment7.position = CGPointMake(3750,0);


    [pavmentGroup addChild:pavment];
    [pavmentGroup addChild:pavment2];
    [pavmentGroup addChild:pavment3];
    [pavmentGroup addChild:pavment4];
    [pavmentGroup addChild:pavment5];
    [pavmentGroup addChild:pavment6];
    [pavmentGroup addChild:pavment7];
    [pavmentGroup addChild:hole1];
    [pavmentGroup addChild:hole2];
    [pavmentGroup addChild:hole3];
    [pavmentGroup addChild:hole4];
    [pavmentGroup addChild:hole5];
    [pavmentGroup addChild:hole6];

    
    SKSpriteNode * pavmentGroupSecondry = [pavmentGroup copy];
    pavmentGroupSecondry.position = CGPointMake(pavmentGroup.position.x + pavmentGroup.size.width, pavmentGroup.position.y);
    pavmentGroupSecondry.name = @"pavmentGroupSecondry";
    
    [self addChild:pavmentGroup];
    [self addChild:pavmentGroupSecondry];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
//    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.xScale = 0.5;
//        sprite.yScale = 0.5;
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//
//        [self addChild:sprite];
//    }
}

-(void)update:(CFTimeInterval)currentTime {
    
    if(!_gameOver){

        SKSpriteNode * ship = (SKSpriteNode *)[self childNodeWithName:@"ship"];
        //NSArray * pavments = [self objectForKeyedSubscript:@"pavmentGroup"];
        SKSpriteNode * hero = (SKSpriteNode *)[self childNodeWithName:@"hero"];

        [_backGroundNode update];
        [_topPavment update];
        [_bottomPavment update];
        
        ship.position = CGPointMake(ship.position.x - 7, ship.position.y);
        if(ship.position.x < self.size.width * -2){
            ship.position = CGPointMake(self.size.width * 2 ,self.size.height/2.0);
        }
        
        //adding commet
//
//        CGRect heroFrame = CGRectMake(hero.position.x - hero.size.width/2, hero.position.y - hero.size.height/2, hero.size.width, hero.size.height);
//    
//        for (SKSpriteNode *  node in ((SKSpriteNode*)pavments[0]).children) {
//            if([node.name isEqualToString:@"hole"]){
//                CGPoint holeCOnverted = [self convertPoint:node.position fromNode:((SKSpriteNode*)pavments[0])];
//                CGRect holeFrame = CGRectMake(holeCOnverted.x  - node.size.width/2, holeCOnverted.y - node.size.height/2, node.size.width, node.size.height);
//                if([self isInFrame:heroFrame frame:holeFrame]){
//                    SKAction * fallDown = [SKAction moveToY:-200 duration:1];
//                    [hero runAction:fallDown  completion:^(void){
//                        //_gameOver = YES;
//                    }];
//                }
//                else{
//                    int g=0;
//                }
//            }
//        }
    }

}

-(void)updatePavement{
    
    NSArray * pavments = [self objectForKeyedSubscript:@"pavmentGroup"];
    NSArray * pavmentsSecnodry = [self objectForKeyedSubscript:@"pavmentGroupSecondry"];

    for (SKNode * node in pavments){
        node.position = CGPointMake(node.position.x - 5, node.position.y);
        if(node.position.x <= (node.frame.size.width * -1)){
            node.position = CGPointMake(node.position.x + node.frame.size.width, node.position.y);
        }
    }

    for (SKNode * node in pavmentsSecnodry){
        node.position = CGPointMake(((SKNode*)pavments[0]).position.x + node.frame.size.width, node.position.y);
    }
}

-(BOOL)isInFrame:(CGRect)objectFrame frame:(CGRect)frame{
    
    if( (objectFrame.origin.x + 10 /*+ objectFrame.size.width*/ >= frame.origin.x && objectFrame.origin.x + 25 <= frame.origin.x + frame.size.width) &&
       objectFrame.origin.y <= frame.origin.y + frame.size.height){
        return YES;
    }
    
    return NO;
}

-(void)cleanScene{
    
    SKSpriteNode * backGroundNode = (SKSpriteNode *)[self childNodeWithName:@"spaceBackGround"];
    SKSpriteNode * backGroundNodeSecnodry = (SKSpriteNode *)[self childNodeWithName:@"spaceBackGroundSecondry"];
    SKSpriteNode * ship = (SKSpriteNode *)[self childNodeWithName:@"ship"];
    SKSpriteNode * pavmentGroup = (SKSpriteNode *)[self childNodeWithName:@"pavmentGroup"];
    SKSpriteNode * hero = (SKSpriteNode *)[self childNodeWithName:@"hero"];
    
    

}

@end
