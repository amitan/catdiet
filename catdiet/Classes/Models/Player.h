//
//  Player.h
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/09.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Tile.h"

@interface Player : CCNode {
    int tileNo;
    MOVE_DIRECTION moveDirectionType; // プレイヤーの移動方向
    int speed; // プレイヤーの移動スピード
    CCSprite *_playerSprite; // プレイヤースプライト
}
@property (nonatomic, readwrite)int tileNo;
@property (nonatomic, readwrite)MOVE_DIRECTION moveDirectionType;
@property (nonatomic, readwrite)int speed;


// 指定した位置にプレイヤーを配置する
- (void)goFrom:(CGPoint)position layer:(CCLayer*)layer;

@end
