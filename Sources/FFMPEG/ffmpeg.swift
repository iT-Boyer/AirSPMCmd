#!/usr/bin/swift sh
//

import ArgumentParser // apple/swift-argument-parser (ArgumentParser)
import SwiftFFmpeg // sunlubo/SwiftFFmpeg

struct ffmpegs: ParsableCommand {
    // 自定义设置
    static var configuration =
      CommandConfiguration(commandName: "bilibli", // 自定义命令名，默认是类型名
                           abstract: "使用swift ffmpeg实现直播功能",
                           discussion: "学习使用swift编写直播软件的支持开发",
                           version: "1.0.0",
                           shouldDisplay: true,
                           subcommands: [],
                           defaultSubcommand: nil,
                           helpNames: NameSpecification.customLong("h"))
}


extension ffmpegs {
    //MARK: 定义自命令 struct结构体
    struct video:ParsableCommand {
        //MARK: 配置
        static var configuration = CommandConfiguration(abstract:"推送视频",
                                                        shouldDisplay: true)
        //MARK: 参数
        @Option(default:0.0, help:"指定开始播放的时间")
        var start: Double
          @Argument(help: "指定视频路径")
          var videoPath: String
          //MARK: flag

          //MARK: 校验
          func validate() throws {
              guard videoPath.count > 0 else {
                  throw ValidationError("请指定视频路径")
              }
        }
        func run() throws {
            //MARK: 命令操作
            print("开始推送视频")
        }
    }
}


ffmpeg.main()
