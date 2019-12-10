//
//  SqliteData.h
//  SwarajyaOBJAssignment
//
//  Created by Vivek Thakur on 09/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

NS_ASSUME_NONNULL_BEGIN

@interface SqliteData : NSObject

{
    sqlite3 *taskDatabase;

}
+(instancetype)getSharedObject;
-(void)createDatabase;
-(NSString *)getDatabasePath;
-(int)executeQuery:(NSString *)query;
-(void)getAllTasks:(NSString *)query;
@property(strong ,nonatomic)NSMutableArray *nameArr;
@property(strong, nonatomic)NSMutableArray *classArr;
@property(strong ,nonatomic)NSMutableArray *sectionArr;
@property(strong,nonatomic)NSMutableArray *rollNoArr;


@end

NS_ASSUME_NONNULL_END
