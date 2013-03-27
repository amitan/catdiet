//
//  TileController.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/06.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TileController.h"
#import "GameScene.h"
#import "GameUtil.h"
#import "TileCross.h"
#import "TileHorizontal.h"
#import "TileVertical.h"
#import "TileTLBR.h"
#import "TileBLTR.h"
#import "TileTL.h"
#import "TileTR.h"
#import "TileBL.h"
#import "TileBR.h"


@interface TileController ()
    
@property (nonatomic, retain)NSMutableArray *_tiles;

- (Tile*)_createTile:(int)type; // タイルを生成するメソッド
- (void)_showTiles; // タイルを配置するメソッド

@end

@implementation TileController
@synthesize tileNum;
@synthesize sideTileNum;
@synthesize blankTileNo;
@synthesize blankTilePosition;
@synthesize _tiles;

- (id)init {
    self = [super init];
	if (self) {
        self.tileNum = 15; // タイル総数 - ブランクタイル1枚
        self.sideTileNum = 4; // 1辺のタイル総数
        
        // タイルを生成
        self._tiles = [NSMutableArray arrayWithCapacity:self.tileNum];
        for (int i = 0; i < tileNum; i++) {
            Tile *tile = [self _createTile:i%10];
            [self._tiles addObject:tile];
        }
    }
    return self;
}

- (void)dealloc {
    self._tiles = nil;
    [super dealloc];
}

- (void)startController {
    self.blankTileNo = 5;
    [self _showTiles];
}

- (Tile*)_createTile:(int)type {
    Tile *tile;
    switch (type) {
        case 1:
            tile = [TileCross node];
            break;
        case 2:
            tile = [TileHorizontal node];
            break;
        case 3:
            tile = [TileVertical node];
            break;
        case 4:
            tile = [TileTLBR node];
            break;
        case 5:
            tile = [TileBLTR node];
            break;
        case 6:
            tile = [TileBR node];
            break;
        case 7:
            tile = [TileTL node];
            break;
        case 8:
            tile = [TileTR node];
            break;
        case 9:
            tile = [TileBL node];
            break;
        default:
            tile = [TileCross node];
            break;
    }
    return tile;
}

- (void)_showTiles {
    
    // タイル1辺の長さを取得
    CGSize winSize = [[CCDirector sharedDirector] winSize];
    int tileSize = (winSize.width - TILE_MARGIN_W * 2) / self.sideTileNum;

    // タイルをレイヤーに追加
    int currentTileNo = 0;
    for (int i = 0; i < tileNum; i++) {
        if (i == self.blankTileNo) {
            currentTileNo++;
        }
        Tile *tile = (Tile*)[self._tiles objectAtIndex:i];
        tile.tileNo = currentTileNo;
        tile.position = ccp(TILE_MARGIN_W + tileSize / 2 + tileSize * (currentTileNo % self.sideTileNum), 
                            winSize.height - TILE_MARGIN_H - tileSize / 2 - tileSize * (currentTileNo / self.sideTileNum));
        [[GameScene sharedInstance].tileLayer addChild:tile];
        currentTileNo++;
    }
    
    // ブランクタイル位置を追加
    self.blankTilePosition = ccp(TILE_MARGIN_W + tileSize / 2 + tileSize * (self.blankTileNo % self.sideTileNum), 
                                 winSize.height - TILE_MARGIN_H - tileSize / 2 - tileSize * (self.blankTileNo / self.sideTileNum));
}

-(Tile*) getTileAtTileNo:(int)tileNo
{
	Tile* result = nil;
	for (Tile* tile in self._tiles) {
		if (tile.tileNo == tileNo) {
			result = tile;
			break;
		}
	}
	return result;
}

- (Tile*)getMovableTouchedTile:(CGPoint)touchLocation {

    // 移動可能タイルを格納する仮リストを生成
    CCArray* tmpSearchList = [CCArray arrayWithCapacity:self.sideTileNum];
    
    // ブランクタイル上をチェック
    Tile *nextTile = [self getNextTile:TILE_TOP currentTileNo:blankTileNo];
    if (nextTile != nil) {
        [tmpSearchList addObject:nextTile];
    }
    // ブランクタイル下をチェック
    nextTile = [self getNextTile:TILE_BOTTOM currentTileNo:blankTileNo];
    if (nextTile != nil) {
        [tmpSearchList addObject:nextTile];
    }
    // ブランクタイル右をチェック
    nextTile = [self getNextTile:TILE_RIGHT currentTileNo:blankTileNo];
    if (nextTile != nil) {
        [tmpSearchList addObject:nextTile];
    }
    // ブランクタイル左をチェック
    nextTile = [self getNextTile:TILE_LEFT currentTileNo:blankTileNo];
    if (nextTile != nil) {
        [tmpSearchList addObject:nextTile];
    }
 
    // ブランクタイルに隣接するタイルがタップされたかチェック
    Tile* result = nil;
    for (Tile *tile in tmpSearchList) {
        if ([tile containsTouchLocation:touchLocation]) {
            result = tile;
            break;
        }
    }
    tmpSearchList = nil;
    return result;
}

- (Tile*)getNextTile:(TILE_POSITION)tilePosition currentTileNo:(int)tileNo {

    int checkPosition;
    switch (tilePosition) {
        case TILE_RIGHT:
            checkPosition = tileNo + 1;
            if (checkPosition % self.sideTileNum != 0) {
                return [self getTileAtTileNo:checkPosition];
            }
            break;
        case TILE_LEFT:
            checkPosition = tileNo - 1;
            if (tileNo % self.sideTileNum != 0) {
                return [self getTileAtTileNo:checkPosition];
            }
            break;
        case TILE_TOP:
            checkPosition = tileNo - self.sideTileNum;
            if (checkPosition > -1) {
                return [self getTileAtTileNo:checkPosition];
            }
            break;
        case TILE_BOTTOM:
            checkPosition = tileNo + self.sideTileNum;
            if (checkPosition <= self.tileNum) {
                return [self getTileAtTileNo:checkPosition];
            }
        default:
            break;
    }
    return nil;
}

-(void)switchBlankWith:(Tile *)tile {
    
    // タッチしたタイル情報とブランク情報を交換
    int tmpTileNo = tile.tileNo;
    CGPoint tmpTilePosition = tile.position;
    tile.tileNo = self.blankTileNo;
    tile.position = self.blankTilePosition;
    self.blankTileNo = tmpTileNo;
    self.blankTilePosition = tmpTilePosition;
    
    // 移動したタイル上にプレイヤーがいる場合、タイルの移動をプレイヤーに通知
    PlayerController *playerController = (PlayerController*)[GameScene sharedInstance].playerController;
    if (playerController.player.tileNo == self.blankTileNo) {
        playerController.player.tileNo = tile.tileNo;
        [playerController moveTo:tile.position from:self.blankTilePosition];
    }
}

@end
