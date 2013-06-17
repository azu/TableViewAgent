//
// Created by P.I.akura on 2013/06/15.
// Copyright (c) 2013 P.I.akura. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "TableViewAgent.h"

@implementation TableViewAgent

- (void)setCellId:(NSString *)c {
    cellId = c;
}
- (void)setViewObjects:(id)v {
    viewObjects = v;
}

- (void)setDelegate:(id)d {
    delegate = d;
    [[d tableView] setDelegate:self];
    [[d tableView] setDataSource:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    [cell setViewObject:[self viewObjectWithIndex:indexPath]];
    return cell;
}

- (id)viewObjectWithIndex:(NSIndexPath *)path {
    return viewObjects[path.row];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)redraw {
    for (id cell in [[delegate tableView] visibleCells]) {
        [cell setViewObject:[self viewObjectWithIndex:[[delegate tableView] indexPathForCell:cell]]];
    }
}
- (void)insertRowWithSection:(NSInteger)section {
    [[delegate tableView] insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[viewObjects count] - 1 inSection:section]] withRowAnimation:UITableViewRowAnimationAutomatic];
}
@end