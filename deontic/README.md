# Policy query

A RDF Surfaces and Notation3 implementation trying to implement deontic rules.

## Policies

- `policy1.ttl` - a prohibiton to TalkLoudly
- `policy2.ttl` - a permission to UseBathRoom
- `policy3.ttl` - a duty to WashDishes
- `policy4.ttl` - a duty to WashDishes and a duty to PutDishesInCupboard
- `policy5.ttl` - a prohibition to talk TalkLoudly and a prohibition to EatLoudly

## Deontic rules

Minimal deontic logic : "Sartor G (2006) Fundamental legal concepts: a formal and teleological characterisation. Artif Intell Law 14(1–2):101–142"

- **Prohibition** action(X) = **Duty** NOT action(X)
- **Permission** action(X) = NOT **Prohibition** action(X)
- IF **Duty** action(X) THEN **Permission** action(X)
- IF **Duty** action(X) AND **Duty** action(Y) THEN **Duty** action(X AND Y)

## Demo

Run all tests:

```
./test_surfaces.sh all
```

Test if we can TalkLoudly for `policy1.ttl`:

```
./test_surfaces.sh policy1.ttl TalkLoudly

# produces

:You :have (:duty :NotTalkLoudly).
:You :have (:prohibition :TalkLoudly).

# remark we seem to mis a permission NotTalkLoudly
```

Show all inferences for `policy1.ttl`:

```
./test_surfaces.sh policy1.ttl
```