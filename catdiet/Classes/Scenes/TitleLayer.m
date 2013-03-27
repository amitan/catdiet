//
//  TitleLayer.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/06.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "TitleLayer.h"
#import "StageLayer.h"
#import "GameUtil.h"

@interface TitleLayer ()

// タイトル画面でSTARTボタンがタップされたときに呼ばれるメソッド
-(void)clickStartButton:(id)sender;

@end


@implementation TitleLayer

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	TitleLayer *layer = [TitleLayer node];
	[scene addChild:layer];
	return scene;
}

- (id)init {
    self = [super init];
    if (self) {
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
		// STARTラベルを作成
		CCLabelTTF *label = [GameUtil createLabel:@"START" fontSize:36];
        CCMenuItemLabel *item = [CCMenuItemLabel itemWithLabel:label
                                                        target:self
                                                      selector:@selector(clickStartButton:)];
        CCMenu *menu = [CCMenu menuWithItems:item, nil];
		menu.position =  ccp(winSize.width/2 , winSize.height/6);
		[self addChild: menu];
    }
    return self;
}

- (void)clickStartButton:(id)sender {
    CCScene *transition = [CCTransitionFade transitionWithDuration:1.0
                                                             scene:[StageLayer scene]
                                                         withColor:ccc3(255, 255, 255)];
    [[CCDirector sharedDirector] replaceScene:transition];
}

@end
