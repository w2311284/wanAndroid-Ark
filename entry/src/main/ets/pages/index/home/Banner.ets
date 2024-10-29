import BannerItemModel from '../../../models/Banner'

@Component
struct Banner {
 @Prop banners: Array<BannerItemModel> = [];
  build() {
      Swiper() {
        ForEach(this.banners, (item: BannerItemModel) => {
          Image(item.imagePath)
            .width('100%')
            .height('100%')
            .borderRadius(15)
        })
      }
      .height(180)
      .width('100%')
      .padding({
        left: 16,
        right: 16,
        top: 6,
        bottom: 6
      })
      .indicator(
        new DotIndicator()
          .itemWidth(10)
          .itemHeight(10)
          .selectedItemWidth(10)
          .selectedItemHeight(10)
          .color(Color.White)
          .selectedColor(Color.Brown)
      )
  }
}

export default Banner