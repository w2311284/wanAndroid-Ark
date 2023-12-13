import Constants from '../common/constants/Constants'
@Component
export default struct PutDownRefresh {
  @Link refreshText: Resource;

  build() {
    Row() {
      Image($r("app.media.refresh_load"))
        .width(Constants.REFRESH_ICON_WIDTH)
        .height(Constants.REFRESH_ICON_HEIGHT)
      Text(this.refreshText).fontSize(16).textAlign(TextAlign.Center)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}