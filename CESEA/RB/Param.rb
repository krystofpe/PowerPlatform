Set(
    varTopic;
    Param("Topic")
);;

If(
    varTopic <> Blank();
    Set(
        varRecordQRC;
        LookUp(
            'QRC Topics Repository';
            ID = Value(varTopic)
        )
    )
)

With(
    {varTopic: Param("Topic")};
    If(
        Len(varTopic) = 0;
        Screen_Home;
        Screen_TopicDetail
    )
)

Launch(
    "https://apps.powerapps.com/play/e/c9d94845-6976-4f01-963d-2fa1f3325890/a/f0a51936-57e7-4ed8-accc-ff0184e89bba?tenantId=64af2aee-7d6c-49ac-a409-192d3fee73b8&sourcetime=2023-08-15%2019%3A44%3A46Z&Topic=" 
    & ThisItem.ID &"&hidenavbar=true"
    )

    "https://apps.powerapps.com/play/e/c15b4f4b-d123-efbb-8afd-9df71d525655/a/d2797bc0-1b86-4491-92e9-7dc043c13879?tenantId=9b511fda-f0b1-43a5-b06e-1e720f64520a&hint=7ba34942-ad7b-46d9-863a-63748e18f9c6&sourcetime=1695987387156&Topic=&Param=" 
