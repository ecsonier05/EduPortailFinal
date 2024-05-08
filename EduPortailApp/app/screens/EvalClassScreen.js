import React, { useEffect, useState } from 'react';
import { Text, StyleSheet, View, ScrollView, TouchableOpacity, Alert} from 'react-native';
import { useRoute } from "@react-navigation/native";
import { Dropdown } from 'react-native-element-dropdown';

export default function EvalClassScreen(props) {

    const route = useRoute();
    const id = route.params?.id;

    const renderList = () => {

        const listItems = [];

        for (let i = 0; i < 8; i++) {
            listItems.push(
                <View style={styles.testListItems} key={i}>
                    <Text style={styles.testDate}>2024-05-21</Text>
                    <Text style={styles.evalType}>Devoir 4</Text>
                    <Text style={styles.grade}>32/35 - 91.43%</Text>
                    <View style={styles.buttonContainer}>
                        {/*add if condition for displaying button (disable and turn grey if empty)*/}
                        <TouchableOpacity style={styles.retroButton} onPress={() => Alert.alert('Retroaction', 'test')}>
                            <Text style={styles.retroText}>Voir retroaction</Text>
                        </TouchableOpacity>
                    </View>
                </View>
            );
        }

        return listItems;
    }

    //Drop Down List
    const data = [
        { label: 'Date (plus recente)', value: '1' },
        { label: 'Date (plus ancienne)', value: '2' },
        { label: 'Note (plus elevee)', value: '3' },
        { label: 'Note (plus basse)', value: '4' },
    ];

    const [value, setValue] = useState(null);
    const [isFocus, setIsFocus] = useState(false);

    return (
        <View style={styles.container}>
            <Text style={styles.evalClassTitle}>
                {/*change with selected class (filter)*/}
                <Text style={styles.titleID}>PROG1297</Text>
                <Text> - Programmation Web PHP et Ajax</Text>
            </Text>

            <View style={styles.classInfoContainer}>
                <Text style={{fontSize: 20}}>Session: {id}</Text>
                <Text style={{fontSize: 20}}>Enseignant: Joel Boudreau</Text>
            </View>


            <View style={styles.filterContainer}>
                <Text>Trier par</Text>
                <Dropdown
                    style={[styles.dropdown, isFocus && { borderColor: 'blue' }]}
                    placeholderStyle={styles.placeholderStyle}
                    selectedTextStyle={styles.selectedTextStyle}
                    inputSearchStyle={styles.inputSearchStyle}
                    data={data}
                    labelField="label"
                    valueField="value"
                    placeholder={!isFocus ? 'Select item' : '...'}
                    searchPlaceholder="Search..."
                    value={value}
                    onFocus={() => setIsFocus(true)}
                    onBlur={() => setIsFocus(false)}
                    onChange={item => {
                        setValue(item.value);
                        setIsFocus(false);
                    }}
                />
            </View>

            <View style={styles.testsListContainer}>
                <ScrollView style={styles.testsListScroll}>
                    {renderList()}
                </ScrollView>
            </View>
        </View>  
    );
}

const styles = StyleSheet.create({
    //main Container
    container: {
        flex: 1,
        backgroundColor: '#e7eff6',
        alignItems: 'center',
        justifyContent: 'flex-end',
    },
    evalClassTitle: {
        fontSize: 25,
        textAlign: 'center',
        position: 'absolute',
        top: 15,
        width: '90%',
    },
    titleID: {
        fontSize: 35,
        fontWeight: 'bold',
    },
    classInfoContainer: {
        position: 'absolute',
        top: '11%',
        left: '6%',
    },
    filterContainer: {
        width: '85%',
        height: 60,
        borderRadius: 5,
        position: 'absolute',
        top: '18%',
    },
    dropdown: {
        height: 25,
        borderColor: 'gray',
        backgroundColor: 'white',
        borderWidth: 2,
        borderRadius: 8,
        paddingHorizontal: 8,
        marginTop: 5
    },
    testsListContainer: {
        position: 'absolute',
        top: '30%',
        width: '90%',
        height: '65%'
    },
    testsListScroll: {
        backgroundColor: 'white',
        borderRadius: 5,
    },
    testListItems: {
        flexDirection: 'row',
        backgroundColor: '#adcbe3',
        borderColor: '#2a4d69',
        height: 40,
        borderRadius: 5,
        borderWidth: 2,
        alignItems: 'center',
        justifyContent: 'space-between',
    },
    testDate: {
        flex: 1,
        textAlign: 'center',
        marginHorizontal: 5,
    },
    evalType: {
        flex: 1,
        textAlign: 'center',
        marginHorizontal: 5,
    },
    grade: {
        flex: 1,
        textAlign: 'center',
        marginHorizontal: 5,
    },
    buttonContainer: {
        flex: 1,
        marginHorizontal: 10,
    },
    retroButton: {
        backgroundColor: '#4b86b4',
        height: 20,
        width: 85,
        borderRadius: 5,
        justifyContent: 'center'
    },
    retroText: {
        textAlign: 'center',
        color: 'white',
        fontWeight: 'bold',
    }
})