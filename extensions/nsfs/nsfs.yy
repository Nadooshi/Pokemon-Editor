{
  "optionsFile": "options.json",
  "options": [],
  "exportToGame": true,
  "supportedTargets": 113497714299118,
  "extensionVersion": "1.0.2",
  "packageId": "cc.yal.nsfs",
  "productId": "479BA64C943D4E6A670CEE8CF960FC0C",
  "author": "",
  "date": "2018-04-06T09:32:03",
  "license": "Proprietary",
  "description": "",
  "helpfile": "",
  "iosProps": true,
  "tvosProps": false,
  "androidProps": true,
  "installdir": "",
  "files": [
    {"filename":"nsfs.dll","origname":"extensions\\nsfs.dll","init":"","final":"","kind":1,"uncompress":false,"functions":[
        {"externalName":"nsfs_get_status","kind":11,"help":"","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"nsfs_get_status","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"nsfs_get_directory","kind":11,"help":"","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"nsfs_get_directory","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"nsfs_set_directory","kind":11,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"nsfs_set_directory","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"nsfs_init_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"nsfs_init_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_get_attributes_ns","kind":11,"help":"file_get_attributes_ns(path) : returned values as per https://msdn.microsoft.com/en-us/library/windows/desktop/gg258117(v=vs.85).aspx","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_get_attributes_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_set_attributes_ns","kind":11,"help":"file_set_attributes_ns(path, flags) : flags as per https://msdn.microsoft.com/en-us/library/windows/desktop/gg258117(v=vs.85).aspx","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            2,
          ],"resourceVersion":"1.0","name":"file_set_attributes_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_get_size_ns","kind":11,"help":"file_get_size_ns(path) : Returns size of the given file, in bytes.","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_get_size_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_exists_ns","kind":11,"help":"file_exists_ns(path)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_exists_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_exists_ns","kind":11,"help":"directory_exists_ns(path)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"directory_exists_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_delete_ns","kind":11,"help":"file_delete_ns(path)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_delete_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_delete_ns","kind":11,"help":"directory_delete_ns(path)","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"directory_delete_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_copy_ns","kind":11,"help":"file_copy_ns(from, to)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"file_copy_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_copy_ns","kind":11,"help":"directory_copy_ns(from, to)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"directory_copy_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_rename_ns","kind":11,"help":"file_rename_ns(from, to)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"file_rename_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_rename_ns","kind":11,"help":"directory_rename_ns(from, to)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"directory_rename_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_move_ns","kind":11,"help":"file_move_ns(from, to)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"file_move_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"directory_move_ns","kind":11,"help":"directory_move_ns(from, to)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            1,
          ],"resourceVersion":"1.0","name":"directory_move_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_find_first_ns","kind":11,"help":"file_find_first_ns(mask)","hidden":false,"returnType":1,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"file_find_first_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_find_next_ns","kind":11,"help":"file_find_next_ns()","hidden":false,"returnType":1,"argCount":0,"args":[],"resourceVersion":"1.0","name":"file_find_next_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_find_close_ns","kind":11,"help":"file_find_close_ns()","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"file_find_close_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_find_attributes_ns","kind":11,"help":"file_find_attributes_ns() : Returns the attributes of the current file in file_find","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"file_find_attributes_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_find_size_ns","kind":11,"help":"file_find_size_ns() : Returns the size (in bytes) of the current file in file_find","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"file_find_size_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_open_read_ns","kind":11,"help":"file_text_open_read_ns(path, codepage) : Codepage can be set to -1 for default (UTF-8)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            2,
          ],"resourceVersion":"1.0","name":"file_text_open_read_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_open_write_ns","kind":11,"help":"file_text_open_write_ns(path, codepage) : Codepage can be set to -1 for default (UTF-8)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            2,
          ],"resourceVersion":"1.0","name":"file_text_open_write_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_open_append_ns","kind":11,"help":"file_text_open_append_ns(path, codepage) : Codepage can be set to -1 for default (UTF-8)","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            2,
          ],"resourceVersion":"1.0","name":"file_text_open_append_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_close_ns","kind":11,"help":"file_text_close_ns(fileid)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_close_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_eof_ns","kind":11,"help":"file_text_eof_ns(fileid)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_eof_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_read_line_ns","kind":11,"help":"file_text_read_line_ns(fileid) : Reads the next line from a file, skips line separators after it.","hidden":false,"returnType":1,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"file_text_read_line_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"file_text_write_line_ns","kind":11,"help":"file_text_write_line_ns(fileid, text) : Writes a line and line separators into a file.","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            1,
          ],"resourceVersion":"1.0","name":"file_text_write_line_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_load_ns_raw1","kind":11,"help":"","hidden":false,"returnType":2,"argCount":1,"args":[
            1,
          ],"resourceVersion":"1.0","name":"buffer_load_ns_raw1","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_load_ns_raw2","kind":11,"help":"","hidden":false,"returnType":2,"argCount":2,"args":[
            1,
            2,
          ],"resourceVersion":"1.0","name":"buffer_load_ns_raw2","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_save_ns_raw","kind":11,"help":"","hidden":false,"returnType":2,"argCount":3,"args":[
            1,
            1,
            2,
          ],"resourceVersion":"1.0","name":"buffer_save_ns_raw","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"string_codepage","kind":11,"help":"string_codepage(str, codepage_from, codepage_to) : Converts a string between codepages. From/to can be set to -1 for UTF-8","hidden":false,"returnType":1,"argCount":3,"args":[
            1,
            2,
            2,
          ],"resourceVersion":"1.0","name":"string_codepage","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[],"ProxyFiles":[],"copyToTargets":113497714299118,"order":[],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
    {"filename":"nsfs.gml","origname":"extensions\\gml.gml","init":"nsfs_init","final":"","kind":2,"uncompress":false,"functions":[
        {"externalName":"nsfs_init","kind":11,"help":"","hidden":false,"returnType":2,"argCount":0,"args":[],"resourceVersion":"1.0","name":"nsfs_init","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_load_ns","kind":11,"help":"buffer_load_ns(path)","hidden":false,"returnType":2,"argCount":1,"args":[
            2,
          ],"resourceVersion":"1.0","name":"buffer_load_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_save_ns","kind":11,"help":"buffer_save_ns(buffer, path)","hidden":false,"returnType":2,"argCount":2,"args":[
            2,
            2,
          ],"resourceVersion":"1.0","name":"buffer_save_ns","tags":[],"resourceType":"GMExtensionFunction",},
        {"externalName":"buffer_save_ext_ns","kind":11,"help":"buffer_save_ext_ns(buffer, path, offset, size)","hidden":false,"returnType":2,"argCount":4,"args":[
            2,
            2,
            2,
            2,
          ],"resourceVersion":"1.0","name":"buffer_save_ext_ns","tags":[],"resourceType":"GMExtensionFunction",},
      ],"constants":[
        {"value":"nsfs_get_status()","hidden":false,"resourceVersion":"1.0","name":"nsfs_status","tags":[],"resourceType":"GMExtensionConstant",},
        {"value":"global.g_nsfs_is_available","hidden":false,"resourceVersion":"1.0","name":"nsfs_is_available","tags":[],"resourceType":"GMExtensionConstant",},
      ],"ProxyFiles":[],"copyToTargets":113497714299118,"order":[],"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMExtensionFile",},
  ],
  "classname": "",
  "tvosclassname": null,
  "tvosdelegatename": null,
  "iosdelegatename": null,
  "androidclassname": "",
  "sourcedir": "",
  "androidsourcedir": "",
  "macsourcedir": "",
  "maccompilerflags": "",
  "tvosmaccompilerflags": null,
  "maclinkerflags": "",
  "tvosmaclinkerflags": null,
  "iosplistinject": "",
  "tvosplistinject": null,
  "androidinject": "",
  "androidmanifestinject": "",
  "androidactivityinject": "",
  "gradleinject": "",
  "iosSystemFrameworkEntries": [],
  "tvosSystemFrameworkEntries": [],
  "iosThirdPartyFrameworkEntries": [],
  "tvosThirdPartyFrameworkEntries": [],
  "IncludedResources": [
    "Sprites\\spr_nsfs_demo_white32",
    "Scripts\\demo-scripts\\demo_button",
    "Scripts\\demo-scripts\\demo_trace",
    "Scripts\\demo-scripts\\demo_prompt",
    "Scripts\\demo-scripts\\demo_param",
    "Scripts\\demo-scripts\\demo_sfmt",
    "Scripts\\demo-scripts\\demo_status",
    "Fonts\\fnt_nsfs_demo",
    "Objects\\obj_nsfs_demo",
    "Rooms\\rm_nsfs_demo",
    "Included Files\\nsfs-doc.html",
  ],
  "androidPermissions": [],
  "copyToTargets": 113497714299118,
  "iosCocoaPods": "",
  "tvosCocoaPods": "",
  "iosCocoaPodDependencies": "",
  "tvosCocoaPodDependencies": "",
  "parent": {
    "name": "Extensions",
    "path": "folders/Extensions.yy",
  },
  "resourceVersion": "1.2",
  "name": "nsfs",
  "tags": [],
  "resourceType": "GMExtension",
}