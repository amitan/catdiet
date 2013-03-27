//
//  GameInterfaceLayer.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/06.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameInterfaceLayer.h"
#import "GameScene.h"

@interface GameInterfaceLayer ()

@property (nonatomic, retain)Tile* _touchedTile;

@end

@implementation GameInterfaceLayer
@synthesize _touchedTile;

- (id)init {
    self = [super init];
	if (self) {
        _isTileTouch = NO;
    }
    return self;
}

- (void)dealloc {
    _touchedTile = nil;
    [super dealloc];
}

// 本クラスがアクティブなレイヤーに登録されたタイミングでタッチイベントの受信を開始する
- (void)onEnter {
    [[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self
                                                     priority:0
                                              swallowsTouches:YES];
}

- (void)onExit {
    [[[CCDirector sharedDirector] touchDispatcher] removeDelegate:self];
}


- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {

    // タッチ座標をcocos2d座標に変換
    CGPoint locationInView = [touch locationInView: [touch view]];
	CGPoint touchLocation = [[CCDirector sharedDirector] convertToGL:locationInView];

    // タイルのタッチ判定（ブランクタイルの上下左右のタイルのみ移動可能）
    TileController *tileController = (TileController*)[GameScene sharedInstance].tileController;
    Tile *touchedTile = [tileController getMovableTouchedTile:touchLocation];
    if (touchedTile != nil) {
        _isTileTouch = YES; // タッチ状態に変更
        _touchedTile = touchedTile; // タッチしたタイルを一時保存
        _tileStartPosition = touchedTile.position;
        [_touchedTile activateTouchColor]; // タイルの色を変更
    }
    
    // タッチイベントをこのメソッドで終了させる（他レイヤーのデリゲートメソッドは呼ばない）
    return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
    
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {

    // タイルをブランク位置に移動
    TileController *tileController = (TileController*)[GameScene sharedInstance].tileController;
    if (_isTileTouch) {
        _isTileTouch = NO; // タッチ状態を変更
        [_touchedTile deactivateTouchColor]; // タイルの色を元に戻す
        [tileController switchBlankWith:_touchedTile];
    }
}

- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
    if (_isTileTouch) {
        _isTileTouch = NO; // タッチ状態を変更
        [_touchedTile deactivateTouchColor]; // タイルの色を元に戻す
        _touchedTile.position = _tileStartPosition; // タイル位置を元に戻す
    }
}

@end
