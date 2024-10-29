import { LengthMetrics, router } from '@kit.ArkUI';
import { collectArticle, unCollectArticle } from '../../../api/Collect';
import { ArticleInfoItemModel } from '../../../models/Article';

@Component
export struct ProjectItem {

 @Prop private item: ArticleInfoItemModel = new ArticleInfoItemModel();

  build() {
    Row(){
      // 左侧图片
      Column(){
        Image(this.item.envelopePic)
          .borderRadius(15)
      }
      .height('100%')
      .layoutWeight(1)

      /*右侧文字内容*/
      Column() {
        Text(this.item.title)
          .maxLines(2)
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .textOverflow({overflow: TextOverflow.Ellipsis})
          .fontColor($r('app.color.on_surface'))
        Text(this.item.desc)
          .fontSize(12)
          .margin({top:10,bottom:10})
          .maxLines(4)
          .lineSpacing(LengthMetrics.px(15))
          .textOverflow({overflow: TextOverflow.Ellipsis})
          .fontColor($r('app.color.on_surface_variant'))
        Blank()
        Row(){
          Text(this.item.niceDate)
            .fontSize(12)
            .margin({right: 5})
            .fontColor($r('app.color.on_surface_variant'))
          Text(this.item.author)
            .fontSize(12)
            .fontColor($r('app.color.on_surface_variant'))
          Blank()
          Image(this.item.collect ? $r('app.media.ic_collect') : $r('app.media.ic_un_collect'))
            .size({width:24, height:24})
            .fillColor($r('app.color.primary'))
            .onClick(async  () => {
                if(this.item.collect) {
                  await unCollectArticle(this.item.id)
                  this.item.collect = false
                }else  {
                  await collectArticle(this.item.id)
                  this.item.collect = true
                }
            })
        }
        .width('100%')
      }
      .margin({left:10})
      .height('100%')
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(2)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .height(160)
    .borderRadius(20)
    .backgroundColor($r('app.color.surface_container'))
    .clip(true)
    .padding(10)
    .margin({left:16, right:16, bottom:6,top:6})
    .onClick(() => {
      router.pushUrl({
        url: 'pages/web/WebPage',
        params: {
          url: this.item.link
        }
      })
    })
  }
}