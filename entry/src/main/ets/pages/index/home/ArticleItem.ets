import { LengthMetrics, router } from '@kit.ArkUI';
import { collectArticle, unCollectArticle } from '../../../api/Collect';
import { ArticleInfoItemModel, ArticleInfoItemTag } from '../../../models/Article';

@Component
export struct ArticleItem {
 @State private item: ArticleInfoItemModel = new ArticleInfoItemModel();

  build() {
    Column() {
      Row() {
        Row() {
          Text(this.item.author === "" ? this.item.shareUser : this.item.author)
            .margin({ right: 8 })
            .fontColor($r('app.color.on_surface_variant'))
            .fontSize(13)
            .onClick(() => {
            })
          if (this.item.fresh) {
            Text('新')
              .fontColor($r('app.color.material_red_A400'))
              .fontSize(11)
              .margin({ right: 8 })
          }
          if (this.item.isTopic) {
            Text('置顶')
              .fontColor($r('app.color.material_red_A400'))
              .fontSize(11)
              .margin({ right: 8 })
          }
          ForEach(this.item.tags, (tag: ArticleInfoItemTag) => {
            Text(tag.name)
              .fontSize(11)
              .fontColor($r('app.color.material_green_600'))
              .margin({ right: 8 })
              .onClick(() => {

              })
          })
        }

        Text(this.item.niceDate)
          .fontSize(13)
          .fontColor($r('app.color.on_surface_variant'))

      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Text(this.item.title)
        .margin({ top: 12, bottom: 12, left: 0 })
        .width('100%')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.on_surface'))
        .lineSpacing(LengthMetrics.px(20))
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Row() {
        Text(`${this.item.superChapterName}·${this.item.chapterName}`)
          .fontSize(13)
          .fontColor($r('app.color.on_surface_variant'))
        Image(this.item.collect ? $r('app.media.ic_collect') : $r('app.media.ic_un_collect'))
          .width(24)
          .height(24)
          .onClick( async () => {
            if (this.item.collect) {
              await unCollectArticle(this.item.id)
              this.item.collect = false
            }else {
              await collectArticle(this.item.id)
              this.item.collect = true
            }
          })
          .fillColor($r('app.color.primary'))
      }
      .onClick(() => {

      })
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .backgroundColor($r('app.color.surface_container'))
    .borderRadius(15)
    .justifyContent(FlexAlign.Start)
    .padding(16)
    .margin({
      top: 6,
      bottom: 6,
      left: 16,
      right: 16
    })
    .onClick(() => {
      router.pushUrl({
        url: 'pages/web/WebPage',
        params: {
          url: this.item.link,
          title:this.item.title
        }
      })
    })
  }
}
