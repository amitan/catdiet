//
//  GameInterfaceLayer.h
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/06.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Tile.h"
#import "GameUtil.h"

@interface GameInterfaceLayer : CCLayer {
    BOOL _isTileTouch; // タイルがタッチされているか
    CGPoint _tileStartPosition; // タッチしたタイルの座標
    Tile *_touchedTile; // タッチされたタイル
}

@end
