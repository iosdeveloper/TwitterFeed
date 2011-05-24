TwitterFeed
Created by http://github.com/iosdeveloper

How to use TwitterFeed
======================

1. Add existing frameworks to your own project:
  - libxml2.dylib
    - oauthconsumer requires it and MGTwitterEngine recommends it for XML parsing on the iPhone.
    - Add $SDKROOT/usr/include/libxml2 as a Header Search Path in project info for all targets.
    - Add USE_LIBXML=1 as a Preprocessor Macro in project info for all targets.
  - QuartzCore.framework
    - We use it for rounded corners around profile images.

2. Copy the source files into your own project.
  - You need everything from the Classes/TwitterFeed folder.
  - You need DetailViewController.h and DetailViewController.m.
    - If you don't want a detail view controller, uncomment
      [self setSelectionStyle:UITableViewCellSelectionStyleNone];
      in TwitterFeedCell.m and remove the method
      - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
      in TwitterFeed.m.
  - TwitterFeed is powered by MGTwitterEngine so you need everything from the Classes/MGTwitterEngine folder.
  - You also need everything from the Classes/oauthconsumer folder. oauthconsumer is only required by MGTwitterEngine but not needed for what we do. Altough, it could be useful for further use.

3. Make sure you #import TwitterFeed.h in every class you're going to use TwitterFeed from.

4. Example usage:
  [self.navigationController pushViewController:
   [[[TwitterFeed alloc] initWithUsername:@"twitter"] autorelease] animated:YES];

TwitterFeed license
===================

Open source. Use at your own risk.

MGTwitterEngine is available from: http://github.com/mattgemmell/MGTwitterEngine

oauthconsumer is available from: http://github.com/ctshryock/oauthconsumer

Includes MGTwitterEngine code by http://mattgemmell.com