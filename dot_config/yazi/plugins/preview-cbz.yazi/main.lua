local M = {}

function M:peek(job)
  local start, cache = os.clock(), ya.file_cache(job)
  if not cache then
    return
  end

  local ok, err = self:preload(job)
  if not ok or err then
    return ya.preview_widget(job, err)
  end

  ya.sleep(math.max(0, rt.preview.image_delay / 1000 + start - os.clock()))

  local _, err = ya.image_show(cache, job.area)
  ya.preview_widget(job, err)
end

function M:seek() end

local function get_ext(filename)
  return filename:match("%.([^%.]+)$")
end

local img_exts = {
  jpg = true,
  jpeg = true,
  png = true,
  webp = true,
}

local function is_image(filename)
  local ext = get_ext(filename)
  return ext and img_exts[ext:lower()]
end

local function img_list(file_list)
  local images = {}
  for line in file_list:gmatch("[^\r\n]+") do
    -- ya.dbg("Processing line: " .. tostring(line))
    if is_image(line) then
      table.insert(images, line)
    end
  end
  return images
end


function M:preload(job)
  local cache = ya.file_cache(job)
  if not cache or fs.cha(cache) then
    return true
  end

  ya.dbg("Preloading image from zip: " .. tostring(job.file.path))
  ya.dbg("Quoted file path: " .. ya.quote(tostring(job.file.path)))
  ya.dbg("Cache path: " .. tostring(cache))

  local file_list, err = Command("unzip")
      :arg("-Z1"):arg(tostring(job.file.path))
      :output()

  if not file_list then
    return false, Err("Failed to spawn command" .. err)
  end

  if not file_list.status.success then
    return false,
        Err("Failed to list zip contents: " .. (file_list.stderr and tostring(file_list.stderr) or "unknown error"))
  end

  ya.dbg("zip contents: " .. tostring(file_list.stdout))

  local img_list = img_list(file_list.stdout or "")

  ya.dbg("images in zip: " .. table.concat(img_list, ", "))

  local first_img = img_list[1]

  -- local unzip_command = [[ unzip -Z1 ]] .. ya.quote(tostring(job.file.path))
  -- local command = unzip_command .. [[ | grep -iE '\.(jpg|jpeg|png|bmp|gif)$' | head -n 1 ]]

  -- ya.dbg("Command to get first image in zip: " .. command)

  -- local output, err = Command("sh")
  --     :arg({
  --       "-c", command,
  --     })
  --     :output()

  -- if not output then
  --   return false, Err("Failed to spawn command" .. err)
  -- end

  -- if not output.status.success then
  --   return false,
  --       Err("Failed to get first image in zip: " .. (output.stderr and tostring(output.stderr) or "unknown error"))
  -- end

  -- local first_img = output.stdout and tostring(output.stdout):gsub("%s+$", "") or ""
  local ext = first_img:match("%.([^%.]+)$")

  ya.dbg("Extracting image from zip: " .. tostring(first_img))
  ya.dbg("Output path: " .. tostring(cache .. "." .. ext))

  local unzip_command = [[ unzip -p ]] .. ya.quote(tostring(job.file.path)) .. " " .. ya.quote(first_img)
  local command = unzip_command .. [[ > ]] .. ya.quote(cache .. "." .. ext)

  ya.dbg("Command to extract image from zip: " .. command)

  local output, err = Command("sh")
      :arg({
        "-c", command,
      })
      :output()

  if not output then
    return false, Err("Failed to spawn command" .. err)
  end

  if not output.status.success then
    return false,
        Err("Failed to extract image from zip: " .. (output.stderr and tostring(output.stderr) or "unknown error"))
  end

  return ya.image_precache(Url(cache .. "." .. ext), cache)
end

return M
