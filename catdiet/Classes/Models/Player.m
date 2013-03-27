//
//  Player.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/09.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Player.h"
#import "GameScene.h"
#import "TileController.h"

@interface Player ()
- (CGPoint)_getNextPosition:(ccTime)dt;
@end

@implementation Player
@synthesize tileNo;
@synthesize moveDirectionType;
@synthesize speed;

- (id)init {
    self = [super init];
	if (self) {
        _playerSprite = [CCSprite spriteWithFile:@"cat.png"];
        [self addChild:_playerSprite];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)goFrom:(CGPoint)position layer:(CCLayer *)layer {
    self.position = position;
    [layer addChild:self];
    [self scheduleUpdate];
}

- (void)update:(ccTime)dt {
    CCLOG(@"update");
    
    
    // プレイヤーを移動する
    self.position = [self _getNextPosition:dt];
    
    // 現在のタイルの終点かどうか判定する
    TileController *tileController = [GameScene sharedInstance].tileController;
    Tile *currentTile = [tileController getTileAtTileNo:tileNo];
    if ([currentTile isEnd:self.position direction:moveDirectionType]) {

        // 終点の場合には次のタイルを探す
        [self unscheduleUpdate];
        Tile* nextTile = [tileController getNextTile:[GameUtil getEndTilePosition:moveDirectionType] currentTileNo:tileNo];

        if (nextTile == nil) { // 次のタイルがない場合はダメージを受ける
            id action = [CCShaky3D actionWithRange:3 shakeZ:NO grid:ccg(10,15) duration:0.5];
            id reset = [CCCallBlock actionWithBlock:^{
                [GameScene sharedInstance].backgroundLayer.grid = nil;
            }];
            [[GameScene sharedInstance].backgroundLayer runAction:[CCSequence actions:action, reset, nil]];
//            [[GameScene sharedInstance].baseLayer runAction:[CCSequence actions:action, reset, nil]];
            
//            if (life < 0 && started == YES) {
//                [[GameScene sharedInstance] gameover];
//            }

        } else { // 次のタイルがある場合はキャラクターの移動を再開する
            TILE_POSITION nextStartTilePosition = [GameUtil getNextStartTilePosition:moveDirectionType];
            self.tileNo = nextTile.tileNo;
            self.position = [nextTile getTilePosition:nextStartTilePosition];
            self.moveDirectionType = [nextTile getMoveDirection:nextStartTilePosition];
            [self scheduleUpdate];
        }
    }
}

-(CGPoint)_getNextPosition:(ccTime)dt {
    CGPoint position = self.position;
    switch (moveDirectionType) {
        case LEFT_TO_RIGHT:
            position = ccp(position.x + speed * dt, self.position.y);
            break;
        case RIGHT_TO_LEFT:
            position = ccp(position.x - speed * dt, self.position.y);            
            break;
        case TOP_TO_BOTTOM:
            position = ccp(position.x, self.position.y - speed * dt);
            break;
        case BOTTOM_TO_TOP:
            position = ccp(position.x, self.position.y + speed * dt);
            break;
        case LEFT_TO_BOTTOM:
        case TOP_TO_RIGHT:
            position = ccp(position.x + speed * dt / 2, self.position.y - speed * dt / 2);
            break;
        case LEFT_TO_TOP:
        case BOTTOM_TO_RIGHT:
            position = ccp(position.x + speed * dt / 2, self.position.y + speed * dt / 2);
            break;
        case RIGHT_TO_TOP:
        case BOTTOM_TO_LEFT:
            position = ccp(position.x - speed * dt / 2, self.position.y + speed * dt / 2);
            break;
        case RIGHT_TO_BOTTOM:
        case TOP_TO_LEFT:
            position = ccp(position.x - speed * dt / 2, self.position.y - speed * dt / 2);
            break;
        default:
            break;
    }
    return position;
}

@end
