//
//  GameUtil.m
//  catdiet
//
//  Created by Ayumi Otomo on 13/03/06.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "GameUtil.h"

const int TILE_MARGIN_W = 20;
const int TILE_MARGIN_H = 100;
const int TILE_BORDER = 10;
const int TILE_SIZE = 70;

@implementation GameUtil

+ (CCLabelTTF *)createLabel:(NSString*)labelWithString fontSize:(int)size{
    return [CCLabelTTF labelWithString:labelWithString fontName:@"Helvetica" fontSize:size];
}

+ (TILE_POSITION)getEndTilePosition:(MOVE_DIRECTION)direction {
    switch (direction) {
        case LEFT_TO_RIGHT:
        case TOP_TO_RIGHT:
        case BOTTOM_TO_RIGHT:
            return TILE_RIGHT;
        case RIGHT_TO_LEFT:
        case TOP_TO_LEFT:
        case BOTTOM_TO_LEFT:
            return TILE_LEFT;
        case TOP_TO_BOTTOM:
        case LEFT_TO_BOTTOM:
        case RIGHT_TO_BOTTOM:
            return TILE_BOTTOM;
        case BOTTOM_TO_TOP:
        case LEFT_TO_TOP:
        case RIGHT_TO_TOP:
            return TILE_TOP;            
        default:
            return TILE_CENTER;
    }
}

+ (TILE_POSITION)getNextStartTilePosition:(MOVE_DIRECTION)direction {
    switch (direction) {
        case LEFT_TO_RIGHT:
        case TOP_TO_RIGHT:
        case BOTTOM_TO_RIGHT:
            return TILE_LEFT;
        case RIGHT_TO_LEFT:
        case TOP_TO_LEFT:
        case BOTTOM_TO_LEFT:
            return TILE_RIGHT;
        case TOP_TO_BOTTOM:
        case LEFT_TO_BOTTOM:
        case RIGHT_TO_BOTTOM:
            return TILE_TOP;
        case BOTTOM_TO_TOP:
        case LEFT_TO_TOP:
        case RIGHT_TO_TOP:
            return TILE_BOTTOM;            
        default:
            return TILE_CENTER;
    }
}

@end
