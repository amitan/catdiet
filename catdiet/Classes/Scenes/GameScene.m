//
//  GameScene.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/05.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"
#import "GameBackgroundLayer.h"


@implementation GameScene
@synthesize backgroundLayer;
@synthesize baseLayer;
@synthesize tileLayer;
@synthesize playerLayer;
@synthesize interfaceLayer;
@synthesize tileController;
@synthesize playerController;


static GameScene *_scene = nil;

+ (GameScene *)sharedInstance {
    if (_scene == nil) {
        _scene = [GameScene node];
    }
	return _scene;
}

- (id)init {
    self = [super init];
	if (self) {
        
        // 背景レイヤーを追加
        self.backgroundLayer = [GameBackgroundLayer node];
        [self addChild:backgroundLayer z:-1];

        // ベースレイヤーを追加
        self.baseLayer = [GameBaseLayer node];
        [self addChild:baseLayer z:0];
        
        // タイルレイヤーを追加
        self.tileLayer = [CCLayer node];
        [self addChild:tileLayer z:10];

        // プレイヤーレイヤーを追加
        self.playerLayer = [CCLayer node];
        [self addChild:playerLayer z:20];

        // ユーザーの入力を受け付けるレイヤーを追加
        self.interfaceLayer = [GameInterfaceLayer node];
        [self.baseLayer addChild:self.interfaceLayer z:100];
        
        // 管理クラスを追加
        self.tileController = [TileController node];
        [self.baseLayer addChild:self.tileController z:-1];
        self.playerController = [PlayerController node];
        [self.baseLayer addChild:self.playerController z:-1];
    }
    return self;
}

- (void)dealloc {
    _scene = nil;
    [super dealloc];
}

- (void) onEnter {
    [super onEnter];
    
    // ゲーム開始
    [self startGame];
}

- (void)startGame {
    [self.tileController startController];
    [self.playerController startController];
}

@end

