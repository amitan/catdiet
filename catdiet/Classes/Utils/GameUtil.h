//
//  GameUtil.h
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/06.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

extern const int TILE_MARGIN_W; // タイルセットの左余白
extern const int TILE_MARGIN_H; // タイルセットの上余白
extern const int TILE_BORDER; // タイルセットの境界線サイズ
extern const int TILE_SIZE; // タイル1辺の長さ

// タイル移動方向
typedef enum {
    MOVE_NONE = 0,
    LEFT_TO_RIGHT = 1,
    RIGHT_TO_LEFT = 2,
    TOP_TO_BOTTOM = 3,
    BOTTOM_TO_TOP = 4,
    LEFT_TO_TOP = 5,
    LEFT_TO_BOTTOM = 6,
    RIGHT_TO_TOP = 7,
    RIGHT_TO_BOTTOM = 8,
    TOP_TO_LEFT = 9,
    TOP_TO_RIGHT = 10,
    BOTTOM_TO_LEFT = 11,
    BOTTOM_TO_RIGHT = 12
    
} MOVE_DIRECTION;

// タイル内の位置
typedef enum {
    TILE_CENTER = 0,
    TILE_RIGHT = 1,
    TILE_LEFT = 2,
    TILE_TOP = 3,
    TILE_BOTTOM = 4
} TILE_POSITION;

// プレイヤーのスピード
typedef enum {
    WALK_SPEED = 5,
    RUN_SPEED = 30
} PLAYER_SPEED;

@interface GameUtil : NSObject

// ラベルを作成する
+ (CCLabelTTF *)createLabel:(NSString*)labelWithString fontSize:(int)size;

// 移動方向をもとにタイルの終点位置を取得する
+ (TILE_POSITION)getEndTilePosition:(MOVE_DIRECTION)direction;

// 移動方向をもとに次のタイルの始点位置を取得する
+ (TILE_POSITION)getNextStartTilePosition:(MOVE_DIRECTION)direction;

@end
