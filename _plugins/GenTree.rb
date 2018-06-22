# -*- coding: UTF-8 -*-
# 扫描docs目录生成HTML文件目录树
# author: Guangqing Li
# email: 469379004@qq.com
module Reading
  require 'digest/sha1'
  require 'find'
  class Generator < Jekyll::Generator

    @@debug = true # 调试模式下，始终重新生成目录文件

    @@docs_root_dir = File.dirname(__FILE__) + "/../docs"

    @@site = nil;# Jekyll::Site对象

    def generate(site)
      puts "\r\n====== Generating sidebar directory tree...... ======"
      # 检查是否存在lock文件
      lock_file_sha1 = ''
      if File::exist?(File.join(File.dirname(__FILE__),'/../_includes',"gen_sidebar.lock")) then
        # 读取文件记录的哈希值
        lock_file_sha1 = File.read( File.join(File.dirname(__FILE__), '/../_includes', "gen_sidebar.lock"))
      end

      # 遍历目录，计算sha1值，所有filename信息存入数组
      file_list = []
      Find.find(@@docs_root_dir) do |filename|
        file_list.push(filename)
      end
      current_dir_sha1 = Digest::SHA1.hexdigest(file_list.to_s)

      # 输出调试信息
      puts 'lock_file_sha1:' + lock_file_sha1
      puts 'current_dir_sha1:' + current_dir_sha1

      # 比较sha1
      if @@debug == false then
        if lock_file_sha1 == current_dir_sha1 then
          puts "Directory has no change."
          puts "====== Generate tree successful! ======"
          return
        else
          puts "Directory has changed."
        end
      end

      # 遍历数组
      @@site = site
      fp = File.new(File.join(File.dirname(__FILE__),'/../_includes',"gen_sidebar.html"),"w+")
      fp.puts('<ul>')
      traverse(@@docs_root_dir,fp)
      fp.puts('</ul>')
      fp.close()
      # 写入lock文件
      fp = File.new(File.join(File.dirname(__FILE__),'/../_includes',"gen_sidebar.lock"),"w+")
      fp.print(current_dir_sha1)
      fp.close()
      puts "====== Generate tree successful! ======"
    end

    # 深度遍历
    def traverse(filepath,fp)
      # 当前路径是目录的情况
      if File.directory?(filepath)
        # 根目录不显示在目录树中
        if(filepath != @@docs_root_dir) then
          # 获取路径中最后一节的目录名
          path = filepath.split('/') # 按斜杠切分
          path.reverse!
          last_dir_name = path[0]
          # 转码输出
          str = '<li>'+last_dir_name+'<ul>'
          fp.puts(str.encode("utf-8"))
        end
        Dir.foreach(filepath) do |filename|
          if filename != "." and filename != ".."
            traverse(filepath + "/" + filename,fp)
          end
        end
        # 根目录不显示在目录树中
        if(filepath != @@docs_root_dir) then
          str = '</ul></li>'
          fp.puts(str.encode("utf-8"))
        end
      else
        # 当前路径是文件的情况
        # 检查文件类型，只识别*.md和*.html
        if filepath =~ /.*\.md$/i or filepath =~ /.*\.html$/i then
          # 获取用于跳转的路径+文件名，不包括后缀（jekyll URL特性）
          path = filepath.split('..')
          str = path[1]  # => /docs/dir/document.md
          if str.index('.md') then
            path = str.split('.md')
          end
          if str.index('.html') then
            path = str.split('.html')
          end
          # 获取用于显示的文件名，不包括后缀和路径
          if filepath =~ /.*\.md$/i then
            basename = File::basename(filepath, '.md')
          end
          if filepath =~ /.*\.html$/i then
            basename = File::basename(filepath, '.html')
          end
          # 用户设置了baseurl的情况
          if @@site.baseurl != '' then
            # 移除路径中开头的多余的斜杠，这样才能使用baseurl
            str = path[0]
            path = str.slice(1,str.length)
            str = '<li><a href="'+ @@site.baseurl+ "/" + path +".html"'">'+basename+'</a></li>'
          else
            str = '<li><a href="' + path[0]+'">'+basename+'</a></li>'
          end
          fp.puts(str.encode("utf-8"))
        end
      end
    end

  end # end class
end # end module