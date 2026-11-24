    - kind: SetVariable
      id: setVariable_Iu2r0Q
      variable: Topic.UpdateStatus
      value: |-
        ="Update started for " & Global.OriginalJD.Title & ". Cards completed. " &
        If(
          IsBlank(Global.SelectedSections),
          "No sections selected; a title review was requested. ",
          "Sections selected: " & Topic.SectionList & ". Reasons: " & Global.UpdateReasons & ". No section has been shown yet. "
        ) &
        "Next step: call Begin First Section now, in this same turn. If the user typed a question while the cards were open, pass your one- or two-sentence answer as EarlierAnswer; otherwise leave it empty. Write no reply of your own before that call."

    - kind: SendActivity
      id: sendActivity_MsxENL
      activity: "{Topic.IntroText}"

outputType:
  properties:
    UpdateStatus:
      displayName: UpdateStatus
      description: "Result of starting the update. If it starts with \"Update started\", the cards are ALREADY COMPLETED: never ask for the cards again. Immediately call Begin First Section in the same turn, passing EarlierAnswer only if the user typed a question while the cards were open, and write no reply of your own before it. If it starts with \"Not started\", a message was already shown; do not add another reply."
      type: String
