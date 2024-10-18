
@Preview
@Component
struct YtList {
  @State refreshing: boolean = false
  @State loading: boolean = false
  @Prop finished: boolean = false
  @Prop dataSource: object[] = []
  @BuilderParam
  renderItem: (item: object) => void
  @BuilderParam
  renderHeader: () => void

  onLoad: () => void = () => {}
  onRefresh: () => void = () => {}
  loadingText: string = '加载中...'
  finishText: string = '没有更多数据啦'

  @State refreshStatus: RefreshStatus = RefreshStatus.Inactive

  @Builder
  getBottomDisplay () {
    Row({space: 10}){
      if (this.finished) {
        Text(this.finishText)
          .fontSize(14)
          .fontColor(Color.Black)
      }else  {
        Text(this.loadingText)
          .fontSize(14)
          .fontColor(Color.Black)
        LoadingProgress().width(20).aspectRatio(1)
          .color(Color.Black)
      }
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  getStatusText() {
    switch (this.refreshStatus) {
      case RefreshStatus.Drag:
        return "继续下拉"
      case RefreshStatus.OverDrag:
        return "松手加载"
      case RefreshStatus.Refresh:
        return "加载中"
      default:
        return ""
    }
  }
  @Builder
  getRefreshDisplay() {
    Row({space: 10}) {
      LoadingProgress()
        .width(40)
        .aspectRatio(1)
        .color(Color.Red)
      Text(this.getStatusText())
        .fontSize(14)
        .fontColor(Color.Black)
    }
    .justifyContent(FlexAlign.Center)
    .height(50)
    .width('100%')
  }

  build() {
    Refresh({ refreshing: $$this.refreshing ,builder: this.getRefreshDisplay}) {
      List() {
        ListItem(){
          if(this.renderHeader) {
            this.renderHeader()
          }
        }

        ForEach(this.dataSource, (item: object) => {
          if (this.renderItem) {
            this.renderItem(item)
          }
        })
        ListItem() {
          this.getBottomDisplay()
        }
      }
      .onReachEnd(async () => {
        // load more
        if (!this.finished && !this.loading) {
          this.loading = true
          await this.onLoad()
          this.loading = false
        }
      })
    }
    .onStateChange(async (state) => {
      this.refreshStatus = state
      // refresh
      if (state === RefreshStatus.Refresh) {
        await this.onRefresh()
        this.refreshing = false
        this.loading = false
      }
    })
  }
}

export { YtList }