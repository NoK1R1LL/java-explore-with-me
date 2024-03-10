package ru.practicum.model;

import javax.persistence.Embeddable;

@Getter
@Setter
@RequiredArgsConstructor
@EqualsAndHashCode
@ToString
@Embeddable
public class Location {

    private Float lat;

    private Float lon;
}
