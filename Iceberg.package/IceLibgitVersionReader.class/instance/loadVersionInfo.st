accessing
loadVersionInfo
  info := MCVersionInfo
    name: self versionName
    id: UUID new
    message: 'fabricated from a Cypress format repository'
    date: Date today
    time: Time now
    author: ''
    ancestors: #()
    stepChildren: #().
