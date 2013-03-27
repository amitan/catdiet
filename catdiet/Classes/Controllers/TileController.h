//
//  TileController.h
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/06.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Tile.h"

@interface TileController : CCNode {
    int tileNum; // タイル総数
    int sideTileNum; // タイル総数
    int blankTileNo; // ブランクタイル番号（0はじまり）
    CGPoint blankTilePosition; // ブランクタイル位置
    NSMutableArray *_tiles; // タイルを格納する配列
}
@property (nonatomic, readwrite)int tileNum;
@property (nonatomic, readwrite)int sideTileNum;
@property (nonatomic, readwrite)int blankTileNo;
@property (nonatomic, readwrite)CGPoint blankTilePosition;


// 動作を開始
- (void)startController;

// 指定したタイルNoに合致するタイルを返す
-(Tile*) getTileAtTileNo:(int)tileNo;

// タッチ座標が含まれる移動可能なタイルを返す
-(Tile*)getMovableTouchedTile:(CGPoint)touchLocation;

// 現在のタイルから指定した方向に隣接するタイルを返す
-(Tile*)getNextTile:(TILE_POSITION)tilePosition currentTileNo:(int)tileNo;

// 指定したタイルとブランクタイルを入れ替える
-(void)switchBlankWith:(Tile*)tile;

@end
