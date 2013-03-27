//
//  Tile.h
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/06.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameUtil.h"

@interface Tile : CCNode {
    int tileNo;
    CCSprite *_tileSprite; // タイルスプライト
}
@property (nonatomic, readwrite)int tileNo;

// タッチ座標がタイル内に含まれているかどうかを返す
-(BOOL)containsTouchLocation:(CGPoint)touchLocation;

// タッチ時のハイライトを有効/無効にする
-(void)activateTouchColor;
-(void)deactivateTouchColor;

// 指定した位置のタイル座標を取得する
-(CGPoint)getTilePosition:(TILE_POSITION) tilePosition;

// 指定した座標が終点かどうかを判断する
-(BOOL)isEnd:(CGPoint)position direction:(MOVE_DIRECTION)direction;

// 指定した始点から移動方向を取得する
-(MOVE_DIRECTION)getMoveDirection:(TILE_POSITION)startPosition;

@end
