//
//  SqliteData.m
//  SwarajyaOBJAssignment
//
//  Created by Vivek Thakur on 09/12/19.
//  Copyright © 2019 Vivek Thakur. All rights reserved.
//

#import "SqliteData.h"

@implementation SqliteData

//    NSMutableArray *nameArr;
//
//NSMutableArray *classArr;
//NSMutableArray *sectionArr;
@synthesize nameArr,classArr,sectionArr,rollNoArr;

+(instancetype)getSharedObject
{
        static SqliteData *sharedObject;
    if(sharedObject==nil)
    {
        sharedObject=[[SqliteData alloc]init];
    }
    
        return sharedObject;
}
-(NSString *)getDatabasePath
{
        NSArray *docDir=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *dbpath=[[docDir firstObject]stringByAppendingString:@"sqliteDatabase.db"];
        return dbpath;
}
-(int)executeQuery:(NSString *)query
{
        int success=0;
        const char *cQuery=[query UTF8String];
        const char *cDatabasePath=[[self getDatabasePath]UTF8String];
        sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath,&taskDatabase)==SQLITE_OK)
        {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
            {
            NSLog(@"Error:%s",sqlite3_errmsg(taskDatabase));
        }
        else
            {
            
            if(sqlite3_step(stmt)==SQLITE_DONE)
                {
                success=1;
                NSLog(@"success");
            }
        }
    }
    return success;
}
-(void)createDatabase
{
  
        NSString *createQ = @"create table if not exists studentTable(id TEXT, studentName TEXT,studentClass TEXT,studentSection TEXT)";
        NSString *charsTableNameQuery = [NSString stringWithFormat:@"%@",createQ];

        int isSuccess=[self executeQuery:charsTableNameQuery];
    if(isSuccess)
        {
        NSLog(@"Database created successfully");
    }
    else
        {
        NSLog(@"Database creation failed");
    }
}
-(void)getAllTasks:(NSString *)query
    {
   
        rollNoArr = [[NSMutableArray alloc]init];
        nameArr = [[NSMutableArray alloc]init];
        classArr = [[NSMutableArray alloc]init];
        sectionArr = [[NSMutableArray alloc]init];
        const char *cQuery=[query UTF8String];
        const char *cDatabasePath=[[self getDatabasePath]UTF8String];
        sqlite3_stmt *stmt;
    if(sqlite3_open(cDatabasePath,&taskDatabase)==SQLITE_OK)
        {
        if(sqlite3_prepare_v2(taskDatabase,cQuery,-1,&stmt,NULL)!=SQLITE_OK)
            {
            NSLog(@"Error:%s",sqlite3_errmsg(taskDatabase));
        }
        else
        {
            while(sqlite3_step(stmt)==SQLITE_ROW)
                {
                const char *roll=(const char *)sqlite3_column_text(stmt,0);
                NSString *sRoll=[NSString stringWithFormat:@"%s",roll];
                [rollNoArr addObject:sRoll];
                
                const char *name=(const char *)sqlite3_column_text(stmt,1);
                NSString *sName=[NSString stringWithFormat:@"%s",name];
                [nameArr addObject:sName];
                
                const char *sClass=(const char *)sqlite3_column_text(stmt,2);
                NSString *classes=[NSString stringWithFormat:@"%s",sClass];
                [classArr addObject:classes];
                
                const char *sec=(const char *)sqlite3_column_text(stmt,3);
                NSString *section=[NSString stringWithFormat:@"%s",sec];
                [sectionArr addObject:section];
                
            }
            
        }
        
    }
}
@end
