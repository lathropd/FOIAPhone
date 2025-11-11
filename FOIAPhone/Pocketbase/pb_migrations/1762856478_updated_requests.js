/// <reference path="../pb_data/types.d.ts" />
migrate((app) => {
  const collection = app.findCollectionByNameOrId("pbc_1003195976")

  // add field
  collection.fields.addAt(9, new Field({
    "cascadeDelete": false,
    "collectionId": "pbc_3054769629",
    "hidden": false,
    "id": "relation1891682022",
    "maxSelect": 1,
    "minSelect": 0,
    "name": "agency",
    "presentable": false,
    "required": false,
    "system": false,
    "type": "relation"
  }))

  return app.save(collection)
}, (app) => {
  const collection = app.findCollectionByNameOrId("pbc_1003195976")

  // remove field
  collection.fields.removeById("relation1891682022")

  return app.save(collection)
})
