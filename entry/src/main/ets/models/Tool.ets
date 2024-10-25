export interface Tool {
  desc: string
  icon: string
  id: number
  isNew: number
  link: string
  name: string
}

export class ToolModel implements Tool{
  desc: string
  icon: string
  id: number
  isNew: number
  link: string
  name: string

  constructor(tool: Tool) {
    this.desc = tool.desc
    this.icon = tool.icon
    this.id = tool.id
    this.isNew = tool.isNew
    this.link = tool.link
    this.name = tool.name
  }

}