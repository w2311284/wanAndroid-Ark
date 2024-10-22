import { LengthMetrics, router } from '@kit.ArkUI';
import { ArticleInfoItemModel, ArticleInfoItemTag } from '../../../models/Article';

@Component
export struct ArticleItem {
  private item: ArticleInfoItemModel = new ArticleInfoItemModel();

  build() {
    Column() {
      Row() {
        Row() {
          Text(this.item.author === "" ? this.item.shareUser : this.item.author)
            .margin({ right: 8 })
            .fontColor($r('app.color.md_theme_on_surface_variant'))
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
          .fontColor($r('app.color.md_theme_on_surface_variant'))

      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)

      Text(this.item.title)
        .margin({ top: 12, bottom: 12, left: 0 })
        .width('100%')
        .fontSize(14)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.begonia_red_light_onSurface'))
        .lineSpacing(LengthMetrics.px(20))
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })

      Row() {
        Text(`${this.item.superChapterName}·${this.item.chapterName}`)
          .fontSize(13)
          .fontColor($r('app.color.iris_blue_light_onSurfaceVariant'))
        Image(this.item.collect ? $r('app.media.icon_collect') : $r('app.media.icon_uncollect'))
          .width(24)
          .height(24)
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .backgroundColor($r('app.color.secondary_background_container'))
    .borderRadius(15)
    .justifyContent(FlexAlign.Start)
    .padding(16)
    .margin({
      top: 6,
      bottom: 6,
      left: 16,
      right: 16
    })
    .shadow({ radius: 10, color: Color.Gray })
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
