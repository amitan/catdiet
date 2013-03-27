//
//  PlayerController.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/09.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PlayerController.h"
#import "Tile.h"
#import "TileController.h"
#import "GameScene.h"

@interface PlayerController ()
- (void)_addPlayer; // プレイヤーをタイル上に配置するメソッド
@end

@implementation PlayerController
@synthesize player;

- (id)init {
    self = [super init];
	if (self) {
        player = [Player node];
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (void)startController {
    [self _addPlayer]; // プレイヤーをタイル上に配置
}

- (void)_addPlayer {
    
    // 始点タイルを取得
    TileController *tileController = [GameScene sharedInstance].tileController;
    Tile* startTile = [tileController getTileAtTileNo:0];
    
    // プレイヤーを始点タイルに追加
    player.tileNo = startTile.tileNo;
    player.speed = WALK_SPEED;
    player.moveDirectionType = LEFT_TO_RIGHT;
    [player goFrom:[startTile getTilePosition:TILE_LEFT] layer:[GameScene sharedInstance].playerLayer];
}

- (void)moveTo:(CGPoint)toPosition from:(CGPoint)fromPosition {

    // イベントを一時停止
    [player unscheduleUpdate];
    
    // タイルの移動方向に従ってプレイヤーの位置を移動
    if (fromPosition.x < toPosition.x) {
        player.position = ccp(player.position.x + TILE_SIZE, player.position.y);
    } else if (fromPosition.x > toPosition.x) {
        player.position = ccp(player.position.x - TILE_SIZE, player.position.y);
    } else if (fromPosition.y < toPosition.y) {
        player.position = ccp(player.position.x, player.position.y + TILE_SIZE);
    } else if (fromPosition.y > toPosition.y) {
        player.position = ccp(player.position.x, player.position.y - TILE_SIZE);
    }
    
    // イベントを再開
    [player scheduleUpdate];
}

@end
