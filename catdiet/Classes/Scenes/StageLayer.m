//
//  StageLayer.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/06.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "StageLayer.h"
#import "GameScene.h"
#import "GameUtil.h"

@implementation StageLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	StageLayer *layer = [StageLayer node];
	[scene addChild:layer];
	return scene;
}

- (id)init {
    self = [super init];
    if (self) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
		// ステージラベルを作成
        CCLabelTTF *label = [GameUtil createLabel:@"1-1" fontSize:36];
        CCMenuItemLabel *item = [CCMenuItemLabel itemWithLabel:label
                                                        target:self
                                                      selector:@selector(clickStartButton:)];
        CCMenu *menu = [CCMenu menuWithItems:item, nil];
		menu.position =  ccp(winSize.width/2 , winSize.height/2);
		[self addChild: menu];
    }
    return self;
}

- (void)clickStartButton:(id)sender {
    GameScene *gameScene = [GameScene sharedInstance];
    CCScene *transition = [CCTransitionFade transitionWithDuration:1.0
                                                             scene:gameScene
                                                         withColor:ccc3(255, 255, 255)];
    [[CCDirector sharedDirector] replaceScene:transition];
}

@end
