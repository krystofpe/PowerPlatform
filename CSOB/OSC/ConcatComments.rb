If(
    Len(textInput.Text) <> 0,
        If(
            Len(varRecord.Comment) = 0,
            User().FullName & " (" & Text(
            Today(),
            "dd.mm.yyyy"
            ) & "): " & Substitute(
            textInput.Text,
             Char(10),
            " "
            ),
            Concatenate(
            varRecord.Comment,
            Char(10),
            User().FullName & " (" & Text(
            Today(),
            "dd.mm.yyyy"
            ) & "): " & Substitute(
            textInput.Text,
            Char(10),
            " "
            )
            )
        ), varRecord.Comment
    )