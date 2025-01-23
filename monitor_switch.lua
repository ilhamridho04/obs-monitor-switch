local obs = obslua

-- Nama scene untuk monitor 1 dan monitor 2 (ubah sesuai kebutuhan)
local scene_monitor_1 = "Scene1" -- Nama scene untuk monitor 1
local scene_monitor_2 = "Scene2" -- Nama scene untuk monitor 2

-- Lebar monitor (sesuaikan dengan resolusi monitor Anda)
local monitor_width = 1366 -- Resolusi horizontal monitor pertama
local monitor_count = 2 -- Jumlah monitor yang digunakan

-- Fungsi untuk mengganti scene
local function switch_scene(scene_name)
    local scenes = obs.obs_frontend_get_scenes()
    if scenes ~= nil then
        for _, source in ipairs(scenes) do
            local name = obs.obs_source_get_name(source)
            if name == scene_name then
                obs.obs_frontend_set_current_scene(source)
                break
            end
        end
        obs.source_list_release(scenes)
    end
end

-- Fungsi untuk membaca posisi kursor
local function get_cursor_position()
    local handle = io.popen("xdotool getmouselocation --shell") -- Jalankan xdotool
    if handle then
        local result = handle:read("*a")
        handle:close()

        -- Parsing hasil xdotool
        local x = tonumber(result:match("X=(%d+)"))
        return x
    end
    return nil
end

-- Variabel untuk menyimpan monitor aktif terakhir
local last_monitor = nil

-- Fungsi utama: mengecek posisi kursor dan mengganti scene
local function check_mouse_position()
    local cursor_x = get_cursor_position()
    if cursor_x then
        local current_monitor = math.floor(cursor_x / monitor_width) + 1

        if current_monitor ~= last_monitor then
            if current_monitor == 1 then
                switch_scene(scene_monitor_1)
            elseif current_monitor == 2 then
                switch_scene(scene_monitor_2)
            end

            -- Perbarui monitor terakhir
            last_monitor = current_monitor
        end
    end
end

-- Callback: Dipanggil secara berkala
function script_tick(seconds)
    check_mouse_position()
end

-- Fungsi konfigurasi script
function script_description()
    return "Script untuk mengganti scene secara dinamis berdasarkan posisi kursor mouse.\n\n" ..
           "Konfigurasikan nama scene dan resolusi monitor di dalam script.\n\n" ..
           "Pastikan xdotool sudah terinstall di sistem Anda.\n" ..
            "Script ini hanya berjalan di sistem Linux.\n\n" ..
            "Dibuat oleh: Ilham Ridho Asysifa'a\n" ..
            "Github: https://github.com/ilhamridho04"
end
