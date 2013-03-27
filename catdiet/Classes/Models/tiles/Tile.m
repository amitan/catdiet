//
//  Tile.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/06.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Tile.h"

@interface Tile ()
@end

@implementation Tile
@synthesize tileNo;

- (id)init {
    self = [super init];
	if (self) {
    }
    return self;
}

- (void)dealloc {
    [super dealloc];
}

- (BOOL)containsTouchLocation:(CGPoint)touchLocation {    
    touchLocation = [self convertToNodeSpace:touchLocation];
    return CGRectContainsPoint(_tileSprite.boundingBox, touchLocation);
}

- (void)activateTouchColor {
    _tileSprite.color = ccc3(255, 200, 200);
}

- (void)deactivateTouchColor {
    _tileSprite.color = ccc3(255, 255, 255);
}

- (CGPoint)getTilePosition:(TILE_POSITION)tilePosition {
    int halfLength = TILE_SIZE / 2;
    switch (tilePosition) {
        case TILE_CENTER:
            return self.position;
        case TILE_LEFT:
            return ccp(self.position.x - halfLength, self.position.y);
        case TILE_RIGHT:
            return ccp(self.position.x + halfLength, self.position.y);
        case TILE_TOP:
            return ccp(self.position.x, self.position.y + halfLength);
        case TILE_BOTTOM:
            return ccp(self.position.x, self.position.y - halfLength);        
        default:
            return self.position;
    }
}

- (BOOL) isEnd:(CGPoint)position direction:(MOVE_DIRECTION)direction {
    TILE_POSITION tilePosition = [GameUtil getEndTilePosition:direction];
    CGPoint endPoint = [self getTilePosition:tilePosition];
    BOOL result = NO;
    switch (tilePosition) {
        case TILE_RIGHT:
            result = (position.x >= endPoint.x) ? YES : NO;
            break;
        case TILE_LEFT:
            result = (position.x <= endPoint.x) ? YES : NO;
            break;
        case TILE_BOTTOM:
            result = (position.y <= endPoint.y) ? YES : NO;
            break;
        case TILE_TOP:
            result = (position.y >= endPoint.y) ? YES : NO;
            break;
        default:
            break;
    }
    if (result) {
        CCLOG(@"isEND %d", tilePosition);
        CCLOG(@"x = %d, endX = %d, y = %d, endY = %d", position.x, endPoint.x, position.y, endPoint.y);        
    }
    return result;
}

@end
