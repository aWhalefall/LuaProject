import os

preFabFilePath = "D:\\luaSample\\LuaProject\\UIClass\\Achievement"
uiFormFilePath = "D:\\luaSample\\LuaProject\\UIClass"
code_temp_path = "D:\\luaSample\\LuaProject\\LuaTeamplate.txt"


def get_folder_name(path):
    folder_name = os.path.basename(path)
    print("Folder name:", folder_name)
    return folder_name


def replace_ClassName_PanelName(className, prefabName, lua_temp, des_file):
    for line in lua_temp:
        if "ClassName" in line:
            temp_line_replace = line.replace("ClassName", className)
            if "PanelName" in temp_line_replace:
                des_file.write(temp_line_replace.replace(
                    "PanelName", prefabName))
            else:
                des_file.write(temp_line_replace)

        elif "PanelName" in line:
            des_file.write(line.replace("PanelName", prefabName))
            print("Replace  {}".format(line.replace("PanelName", prefabName)))
            print("prefabName ={}".format(prefabName))
        else:
             des_file.write(line)


def write_template_to_file(file_path):
    className = os.path.basename(file_path).split(".lua")[0]
    prefabName = className.replace("UIForm", "Panel")
    with open(code_temp_path, 'r') as lua_temp:
        with open(file_path, 'w') as des_file:
            replace_ClassName_PanelName(
                className, prefabName, lua_temp, des_file)
    print("Template written successfully!")


def create_prefab_folder(path):
    if not os.path.exists(path):
        os.makedirs(path)
        prefix_file = get_folder_name(path)
        file_name = path + "\\{}Panel.prefab".format(prefix_file)
        open(file_name, "w").close()
        print("Folder created successfully!")
    else:
        print("Folder already exists!")


def create_uiform_folder(path):
    if not os.path.exists(path):
        os.makedirs(path)
        prefix_file = get_folder_name(path)
        file_name = path + "\\{}UIPanel.prefab".format(prefix_file)
        open(file_name, "w").close()
        print("Folder created successfully!")
    else:
        print("Folder already exists!")


def check_file_exists(folder_path, file_name):
    file_path = os.path.join(folder_path, file_name)
    if not os.path.exists(file_path):
        open(file_path, "w").close()
        write_template_to_file(file_path)
        print("File created successfully!")
    else:
        print("File already exists!")


# with open(code_temp_path, 'r', encoding='UTF-8') as lua_temp:
#     with open("D:\\luaSample\\LuaProject\\UIClass\\AchievementUIForm.lua", 'w', encoding='UTF-8') as des_file:
#         replace_ClassName_PanelName(
#             "AchievementUIForm", "AchievementPanel", lua_temp, des_file)

if __name__ == "__main__":
    create_prefab_folder(preFabFilePath)
    check_file_exists(uiFormFilePath, "{}UIForm.lua".format(
        get_folder_name(preFabFilePath)))
