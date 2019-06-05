import os, sys
sys.path.append(os.path.join(os.path.dirname(__file__), 'common'))
from common import utils

table = utils.read_table("scripts/res/tilemap_files.tbl")
with open(sys.argv[1], "w") as tf:
    tf.write("; auto-generated by {}\n".format(sys.argv[0]))
    tilemap_files = []
    # Pointer table
    for i in table:
        tmap_name = os.path.splitext(os.path.basename(table[i]))[0]
        tf.write("dw {} ; Tilemap 0x{:02X}\n".format(tmap_name, i))
        if tmap_name not in tilemap_files:
            tilemap_files.append(tmap_name)
    tf.write("\n")
    for file in tilemap_files:
        tf.write('{0}:\n  INCBIN "build/tilemaps/{0}.tmap"\n'.format(file))