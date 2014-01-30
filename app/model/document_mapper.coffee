module.exports = class DocumentMapper

  constructor: (@dbController, callback) ->
    @dbController.db.save '_design/activities-state',
      (find_by_stateId:
        map: (doc) ->
          if (doc.type == "activity-state")
            emit(doc.value.value.stateId, doc.value)
      ),
      callback

  save: (document, callback, docType) ->
    object = 
      value: document
      type: docType

    @dbController.db.save object, (err, result) ->
      callback(err, result)

  findStateById: (stateId, callback) ->
    @dbController.db.view 'activities-state/find_by_stateId', key: stateId, (err, docs) ->
      if err?
        callback err
      else
        if docs.length == 0
          err = new Error "Document not found"
          err.httpCode = 404
          callback err
          return
        else
          callback null, docs