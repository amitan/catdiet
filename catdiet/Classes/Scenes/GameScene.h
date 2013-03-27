//
//  GameScene.h
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/05.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameBackgroundLayer.h"
#import "GameBaseLayer.h"
#import "GameInterfaceLayer.h"
#import "TileController.h"
#import "PlayerController.h"

@interface GameScene : CCScene {
    GameBackgroundLayer *backgroundLayer; // 背景レイヤー
    GameBaseLayer *baseLayer; // ベースレイヤー
    CCLayer *tileLayer; // タイルレイヤー
    CCLayer *playerLayer; // タイルレイヤー
    GameInterfaceLayer *interfaceLayer; // 入力を受け付けるレイヤー
    TileController *tileController; // タイル管理クラス
    PlayerController *playerController; // プレイヤー管理クラス
}
@property (nonatomic, retain)GameBackgroundLayer *backgroundLayer;
@property (nonatomic, retain)GameBaseLayer *baseLayer;
@property (nonatomic, retain)CCLayer *tileLayer;
@property (nonatomic, retain)CCLayer *playerLayer;
@property (nonatomic, retain)GameInterfaceLayer *interfaceLayer;
@property (nonatomic, retain)TileController *tileController;
@property (nonatomic, retain)PlayerController *playerController;


// シングルトンオブジェクトを返すメソッド
+ (GameScene *)sharedInstance;

// ゲームを開始する
- (void)startGame;

@end
