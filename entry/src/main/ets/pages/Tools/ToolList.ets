import { YtCustomBaseNavBar } from '@yt/YtKit';
import { getToolList } from '../../api/User';
import { ToolModel } from '../../models/Tool';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct ToolList {
  @State toolDataList: ToolModel[] = []

  aboutToAppear(): void {
    this.getToolList()
  }

  async getToolList() {
    this.toolDataList = await getToolList()
  }

  build() {
    Column() {
      YtCustomBaseNavBar({
        titleOptions: {
          text: '工具列表',
          fontColor: $r('app.color.primary'),
          fontSize: 24
        },
        leftButtons: [
          {
            icon: $r('app.media.ic_arrow_back'),
            onClick: () => {
              router.back()
            }
          }
        ]
      })
      List() {
        ForEach(this.toolDataList, (tool: ToolModel) => {
          ListItem() {
            Row() {
              Image(`https://www.wanandroid.com/resources/image/pc/tools/${tool.icon}`)
                .width(50)
                .height(50)
              Column() {
                Text(tool.name)
                  .fontWeight(500)
                  .fontSize(16)
                Text(tool.desc)
                  .fontSize(12)
                  .margin({top:5})
              }
              .margin({left: 15})
              .alignItems(HorizontalAlign.Start)
              .layoutWeight(1)
            }
            .width('100%')
            .height('100%')
            .onClick(() => {
              router.pushUrl({
                url: 'pages/web/WebPage',
                params: {
                  url: tool.link,
                  title: tool.name
                }
              })
            })
          }
          .height(64)
        })
      }
      .padding({left: 16, right: 16})
      .layoutWeight(1)
    }
  }
}